#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

echo $($PSQL "TRUNCATE TABLE games, teams;")

cat games.csv | while IFS=","; read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  IFS=" "
  if [[ $ROUND == 'Eighth-Final' ]]
  then
    INSERT_WINNER_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER');")
    if [[ $INSERT_WINNER_RESULT ]]
    then
      echo "$WINNER"
    fi
    INSERT_OPPONENT_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT');")
    if [[ $INSERT_OPPONENT_RESULT ]]
    then
      echo "$OPPONENT"
    fi
  fi
done

cat games.csv | while IFS=","; read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  IFS=" "
  if [[ $YEAR != 'year' ]]
  then
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER';")
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT';")
    if [[ -z $WINNER_ID || -z $OPPONENT_ID ]]
    then
      echo "Error: team $WINNER or $OPPONENT not found"
    else
      INSERT_GAMES_RESULT=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS);")
      if [[ $INSERT_GAMES_RESULT == 'INSERT 0 1' ]]
      then
        echo "DB updated: $YEAR $WINNER $OPPONENT"
      else
        echo 'Error updating the DB'
      fi
    fi
  fi
done

