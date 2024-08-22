#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.


# When you run your insert_data.sh script, it should insert a row for each line in the games.csv file (other than the top line of the file). There should be 32 rows. Each row should have every column filled in with the appropriate info. Make sure to add the correct ID's from the teams table (you cannot hard-code the values)

# You should correctly complete the queries in the queries.sh file. Fill in each empty echo command to get the output of what is suggested with the command above it. Only use a single line like the first query. The output should match what is in the expected_output.txt file exactly, take note of the number of decimal places in some of the query results



echo -e "$($PSQL "CREATE TABLE teams(
  team_id SERIAL PRIMARY KEY,
  name VARCHAR(255) UNIQUE NOT NULL
);")"

echo -e "$($PSQL "CREATE TABLE games(
  game_id SERIAL PRIMARY KEY,
  year INT NOT NULL,
  round VARCHAR(50) NOT NULL,
  winner_id INT NOT NULL REFERENCES teams(team_id),
  winner_goals INT NOT NULL,
  opponent_id INT NOT NULL REFERENCES teams(team_id),
  opponent_goals INT NOT NULL
);")"

# test data START
# year, round, winner, opponent, winner_goals, opponent_goals

# 2018,Final,France,Croatia,4,2
# 2018,Third Place,Belgium,England,2,0
# 2018,Semi-Final,Croatia,England,2,1
# 2018,Semi-Final,France,Belgium,1,0
# test data END

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do 
  if [[ $YEAR != year ]]
  then

    # get winning team
    WINNER_ID=$($PSQL "SELECT team_id from teams where name='$WINNER'")

    # if not found
    if [[ -z $WINNER_ID ]]
    then
      # insert winning team into teams table, name column
      INSERT_WINNER_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")

      if [[ $INSERT_WINNER_RESULT == "INSERT 0 1" ]]
      then
        echo Inserted into teams, $WINNER
      fi

      # get new winner name
      WINNER_ID=$($PSQL "SELECT team_id from teams where name='$WINNER'")
    fi


    # get losing team
    OPPONENT_ID=$($PSQL "SELECT team_id from teams where name='$OPPONENT'")

    # if not found
    if [[ -z $OPPONENT_ID ]]
    then
      # insert losing team into teams table, name column
      INSERT_OPPONENT_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")

      if [[ $INSERT_OPPONENT_RESULT == "INSERT 0 1" ]]
      then
        echo Inserted into teams, $OPPONENT
      fi

      # get new loser name
      OPPONENT_ID=$($PSQL "SELECT team_id from teams where name='$OPPONENT'")
    fi

    echo -e $($PSQL "INSERT INTO games(year, round, winner_id, winner_goals, opponent_id, opponent_goals) VALUES($YEAR, '$ROUND', $WINNER_ID, $WINNER_GOALS, $OPPONENT_ID, $OPPONENT_GOALS);")

  fi

done
