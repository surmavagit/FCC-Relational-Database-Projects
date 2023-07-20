if [[ $# == 0 ]]
then
	echo Please provide an element as an argument.
else
	ARG=$1
	if [[ $ARG =~ ^[0-9]+$ ]]
	then
		COLUMN='atomic_number'
	else
		LENGTH=$(echo -n "$ARG" | wc -m)
		if [[ $LENGTH -le 2 ]]
		then
			COLUMN='symbol'
		else
			COLUMN='name'
		fi
	fi
	PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"
	QUERY_RESULT=$($PSQL "SELECT atomic_number, symbol, name, atomic_mass, melting_point_celsius, boiling_point_celsius, type FROM elements FULL JOIN properties USING (atomic_number) FULL JOIN types USING (type_id) WHERE $COLUMN = '$ARG';")
	if [[ -z $QUERY_RESULT ]]
	then
		echo "I could not find that element in the database."
	else
		echo $QUERY_RESULT | while IFS='|'; read ATOMIC_NUMBER SYMBOL NAME ATOMIC_MASS MELTING BOILING TYPE
	do
		echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING celsius and a boiling point of $BOILING celsius."
	done
	fi
fi





