#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=salon --no-align --tuples-only -c"

CUSTOMER_INFO() {
  echo -e "\nPlease enter your phone number:"
  read CUSTOMER_PHONE
  CHECK_PHONE_NUMBER=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
  if [[ -z $CHECK_PHONE_NUMBER ]]
  then
    echo -e "\nIt looks like you are a new customer.\nEnter your name:"
    read CUSTOMER_NAME
    ENTER_CUSTOMER=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
  fi
  echo -e "\nWhat time would you like your appointment?"
  read SERVICE_TIME
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
  SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id=$1")
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
  INSERT_APPOINTMENT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $1, '$SERVICE_TIME')")
  echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
}

MAIN_MENU() {
  GET_SERVICES=$($PSQL "SELECT service_id, name FROM services")
  echo "$GET_SERVICES" | sed 's/|/ | /' | while read SERVICE_ID BAR SERVICE_NAME
  do
    echo "$SERVICE_ID) $SERVICE_NAME"
  done
  read SERVICE_ID_SELECTED
  CHECK_REQUESTED_SERVICE=$($PSQL "SELECT service_id FROM services WHERE service_id=$SERVICE_ID_SELECTED")
  if [[ -z $CHECK_REQUESTED_SERVICE ]]
  then
    MAIN_MENU
  else
    CUSTOMER_INFO $SERVICE_ID_SELECTED
  fi
}


echo -e "\nWhat service would you like to request?"
MAIN_MENU
