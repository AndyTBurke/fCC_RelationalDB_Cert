#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"
RANDOM_NUMBER="$((1 + $RANDOM % 1000))"
USER_GUESS=0
GUESS_ATTEMPTS=0

echo -e "Enter your username: "
read USERNAME

GET_USER_INFO=$($PSQL "SELECT * FROM user_info WHERE username='$USERNAME'")

if [[ -z $GET_USER_INFO ]]
then
  ADD_NEW_USER=$($PSQL "INSERT INTO user_info(username, best_game, games_played) VALUES('$USERNAME', 999999, 1)")
  echo "Welcome, $USERNAME! It looks like this is your first time here."
else
  echo "$GET_USER_INFO" | sed 's/|/ | /g' | while read USER_ID BAR DB_USERNAME BAR BEST_GAME BAR GAMES_PLAYED
  do
    echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
    INCREMENT_NUM_GAMES=$($PSQL "UPDATE user_info SET games_played=$(($GAMES_PLAYED + 1)) WHERE user_id=$USER_ID")
  done
fi


echo "Guess the secret number between 1 and 1000: "
while [[ $RANDOM_NUMBER != $USER_GUESS ]]
do
  GUESS_ATTEMPTS=$(($GUESS_ATTEMPTS + 1))
  read USER_GUESS
  if [[ $USER_GUESS != [0-9]* ]]
  then
    echo "That is not an integer, guess again:"
  fi
  if [[ $USER_GUESS < $RANDOM_NUMBER ]]
  then
    echo "It's higher than that, guess again: "
  fi
  if [[ $USER_GUESS > $RANDOM_NUMBER ]]
  then
    echo "It's lower than that, guess again: "
  fi
  if [[ $USER_GUESS = $RANDOM_NUMBER ]]
  then
    echo "You guessed it in $GUESS_ATTEMPTS tries. The secret number was $RANDOM_NUMBER. Nice job!"
    GET_BEST_GAME=$($PSQL "SELECT best_game FROM user_info WHERE username='$USERNAME'")
    if [[ $GET_BEST_GAME > $GUESS_ATTEMPTS ]]
    then
      INSERT_BEST_GAME=$($PSQL "UPDATE user_info SET best_game=$GUESS_ATTEMPTS WHERE username='$USERNAME'")
    fi
  fi
done
