#!/bin/bash
echo -e "\n~~~ SALON APPOINTMENTS ~~~\n"
PSQL="psql --username=freecodecamp --dbname=salon --tuples-only -c"
SERVICES_LIST=$($PSQL "SELECT * FROM services;")

MAIN_MENU() {
	if [[ -n $1 ]]
	then
		echo -e "\n$1\n"
	fi

	echo "$SERVICES_LIST" | while read SERVICE_ID BAR SERVICE_NAME
	do
		echo "$SERVICE_ID) $SERVICE_NAME"
	done

	read SERVICE_ID_SELECTED
	if [[ -z $SERVICE_ID_SELECTED ]]
	then
		MAIN_MENU "Please, enter a valid service number"
	else
		SERVICE_SELECTED=$(GET_SERVICE_NAME)
		if [[ -z $SERVICE_SELECTED ]]
		then
			MAIN_MENU "Please, enter a valid service number"
		else
			echo -e "\nWhat is your phone number?"
			read CUSTOMER_PHONE
			if [[ -n $CUSTOMER_PHONE ]]
			then
				CHECK_PHONE
			fi
		fi
	fi
}

GET_SERVICE_NAME() {
	echo "$SERVICES_LIST" | while read SERVICE_ID BAR SERVICE_NAME
	do
	  if [[ $SERVICE_ID == $SERVICE_ID_SELECTED ]]
		then
			echo $SERVICE_NAME
			break
		fi
	done
}

CHECK_PHONE() {
	CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE';")
	if [[ -z $CUSTOMER_NAME ]]
	then
		echo -e "\nYour phone number isn't in our database.\nWhat's your name?"
		read CUSTOMER_NAME
		INSERT_USER_RESULT=$($PSQL "INSERT INTO customers(name, phone) VALUES ('$CUSTOMER_NAME', '$CUSTOMER_PHONE');")
		if [[ $INSERT_USER_RESULT == 'INSERT 0 1' ]]
		then
			echo -e "\n$CUSTOMER_NAME added to the database"
		fi
	fi
	echo -e "\nWhat time do you prefer, $CUSTOMER_NAME?"
	read SERVICE_TIME
	if [[ -n $SERVICE_TIME ]]
	then
		INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES ((SELECT customer_id FROM customers WHERE name = '$CUSTOMER_NAME'), $SERVICE_ID_SELECTED, '$SERVICE_TIME');")
		if [[ $INSERT_APPOINTMENT_RESULT == 'INSERT 0 1' ]]
		then
			echo -e "I have put you down for a $SERVICE_SELECTED at $SERVICE_TIME, $CUSTOMER_NAME."
		else
			echo "ERROR: $INSERT_APPOINTMENT_RESULT"
		fi
	fi
}

MAIN_MENU
