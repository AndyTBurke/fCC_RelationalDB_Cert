#!/bin/bash

if [[ -z $1 ]]
then
  echo Please provide an element as an argument.
  exit
fi

PSQL="psql --username=freecodecamp --dbname=periodic_table --no-align --tuples-only -c"


if [[ $1 == [0-9]* ]]
then 
  GET_ELEM_INFO=$($PSQL "SELECT * FROM elements INNER JOIN properties ON elements.atomic_number = properties.atomic_number INNER JOIN types ON properties.type_id = types.type_id WHERE elements.atomic_number='$1'")
else
  if [[ ${#1} < 3 ]]
  then
  GET_ELEM_INFO=$($PSQL "SELECT * FROM elements INNER JOIN properties ON elements.atomic_number = properties.atomic_number INNER JOIN types ON properties.type_id = types.type_id WHERE elements.symbol='$1'")
  fi
  if [[ ${#1} > 2 ]]
  then
    GET_ELEM_INFO=$($PSQL "SELECT * FROM elements INNER JOIN properties ON elements.atomic_number = properties.atomic_number INNER JOIN types ON properties.type_id = types.type_id WHERE elements.name='$1'")
  fi
fi

if [[ -z $GET_ELEM_INFO ]]
then
  echo I could not find that element in the database.
  exit
fi

echo "$GET_ELEM_INFO" | sed 's/|/ | /g' | while read ATOMIC_NUMBER BAR SYMBOL BAR NAME BAR ATOMIC_NUMBER_TWO BAR ATOMIC_MASS BAR MELTING_POINT BAR BOILING_POINT BAR TYPE_ID BAR TYPE_ID_TWO BAR TYPE
do
  echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
done
