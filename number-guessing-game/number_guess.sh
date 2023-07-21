#!/bin/bash

#Ask for name

echo "Enter your username:"
read USERNAME

#Query DB and respond

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

USER_RECORD=$($PSQL "SELECT games_played, best_game FROM users WHERE username = '$USERNAME';")

if [[ -z $USER_RECORD ]]
then
	echo "Welcome, $USERNAME! It looks like this is your first time here."
	GAMES_PLAYED=0
else
	GAMES_PLAYED=$(echo $USER_RECORD | sed -r 's/\|.+$//')
	BEST_GAME=$(echo $USER_RECORD | sed -r 's/^.+\|//')
	echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

#Generate random number

NUMBER=$((RANDOM%1000+1))

#Loop: ask for number

TRIES=1
echo "Guess the secret number between 1 and 1000:"
read GUESS
while [[ ! $GUESS -eq $NUMBER ]]
do
	if [[ ! $GUESS =~ ^[0-9]+$ ]]
	then
		echo "That is not an integer, guess again:"
	else
		if [[ $GUESS -gt $NUMBER ]]
		then
			echo "It's lower than that, guess again:"
		else
			echo "It's higher than that, guess again:"
		fi
	fi
	TRIES=$((TRIES+1))
	read GUESS
done

#Correct guess: message and DB update

GAMES_PLAYED=$((GAMES_PLAYED+1))
if [[ -z $USER_RECORD ]]
then
	#insert all the data
	echo $($PSQL "INSERT INTO users(username, games_played, best_game) VALUES ('$USERNAME', $GAMES_PLAYED, $TRIES);")
else
	if [[ $TRIES -lt $BEST_GAME ]]
	then
		#update the number of games and best game
		DB_UPDATE=$($PSQL "UPDATE users SET games_played = $GAMES_PLAYED, best_game = $TRIES WHERE username = '$USERNAME';")
	else
		#update the number of games only
		DB_UPDATE=$($PSQL "UPDATE users SET games_played = $GAMES_PLAYED WHERE username = '$USERNAME';")
	fi
	echo $DB_UPDATE
fi

echo "You guessed it in $TRIES tries. The secret number was $NUMBER. Nice job!"








