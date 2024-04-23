#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

NUMBER=$(( RANDOM % 10 + 1))

echo -e "\nEnter your username:\n"

read NAME

USER=$($PSQL "select username from users where username='$NAME'")

if [[ -z $USER ]]
then 
    #Si no esta el usuario, lo metemos en la base de datos:     
    INSERT_USER=$($PSQL "insert into users (username) values ('$NAME')")
    echo -e "\nWelcome, $NAME! It looks like this is your first time here."
    echo -e "\nGuess the secret number between 1 and 1000:"

   read GUESS_NUMBER

   CONTA=0 #creamos un contador para saber los intentos hasta que se adivina el numero:
   while [[ $GUESS_NUMBER -ne $NUMBER ]]
   do
      if [[ $GUESS_NUMBER -gt $NUMBER ]]
      then
          CONTA=$((CONTA+1))
          echo -e "\nIt's lower than that ($NUMBER), guess again: number of counts: $CONTA"
          read GUESS_NUMBER   

      elif [[ $GUESS_NUMBER -lt $NUMBER ]]      
      then       
          CONTA=$((CONTA+1))
          echo -e "\nIt's higher than that ($NUMBER), guess again:  number of counts: $CONTA"
          read GUESS_NUMBER            
      fi
   done
   echo -e "You guessed it in $CONTA tries. The secret number was $NUMBER." 

#En caso de que el usuario ya este registrado en la base de datos, 
else 

fi





