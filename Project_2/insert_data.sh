#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
TRUNCATE=$($PSQL "TRUNCATE TABLE games, teams")

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  if [[ $WINNER != "winner" ]]
  then
  TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    if [[ -z $TEAM_ID ]]
    then
    INSERT_TEAM=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
    fi
  fi
  if [[ $OPPONENT != "opponent" ]]
  then
  TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
    if [[ -z $TEAM_ID ]]
    then
    INSERT_TEAM=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
    fi
  fi
  if [[ $YEAR != "year" ]]
  then
    GAME=$($PSQL "INSERT INTO games(winner_id, opponent_id, year, round, winner_goals, opponent_goals) VALUES((SELECT team_id FROM teams WHERE name='$WINNER'), (SELECT team_id FROM teams WHERE name='$OPPONENT'), '$YEAR', '$ROUND', '$WINNER_GOALS', '$OPPONENT_GOALS')")
  fi

done

