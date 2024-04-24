#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"


#Funcion para leer los datos de entrada :
READ_NUMBER() {

   echo -e "\nGuess the secret number between 1 and 1000:"
   read GUESS_NUMBER
   CONTA=0 #creamos un contador para saber los intentos hasta que se adivina el numero:
   while [[ $GUESS_NUMBER -ne $NUMBER ]]
   do
      if [[ $GUESS_NUMBER -gt $NUMBER ]]
      then
          CONTA=$((CONTA+1))
          echo -e "\nIt's lower than that, guess again:"
          read GUESS_NUMBER   

      elif [[ $GUESS_NUMBER -lt $NUMBER ]]      
      then       
          CONTA=$((CONTA+1))
          echo -e "\nIt's higher than that, guess again:"
          read GUESS_NUMBER            
      fi
   done
   CONTA=$((CONTA+1))
   echo -e "\nYou guessed it in $CONTA tries. The secret number was $NUMBER. Nice job!"
}




NUMBER=$(( RANDOM % 10 + 1))

echo -e "\nEnter your username:\n"

read NAME

USER=$($PSQL "select username from users where username='$NAME'")

if [[ -z $USER ]]
then 
    #Si no esta el usuario, lo metemos en la base de datos:     
    INSERT_USER=$($PSQL "insert into users (username) values ('$NAME')")
    echo -e "\nWelcome, $NAME! It looks like this is your first time here."

    READ_NUMBER

    #Metemos en la tabla games un nuevo registro con el numero de partidos jugados (en este caso 1 ya que es el primero), el numero de intentos y el user_id
    INSERT_DATA=$($PSQL "insert into games (user_id, games_played, guesses) values ((select id from users where username='$NAME'),1,$CONTA)") 


#En caso de que el usuario ya este registrado en la base de datos, 
else 
    #Sacamos el numero de partidas que lleva jugadas y la mejor puntuacion de todas las que lleva. 
    #select games_played, guesses from users inner join games on users.id=games.user_id where username='pepe';
    GUESSES=$($PSQL "select max(guesses) from games inner join users on users.id=games.user_id where username='$USER' ")
    GAMES_PLAYED=$($PSQL "select max(games_played) from games inner join users on users.id=games.user_id where username='$USER' ")
    echo -e "\nWelcome back, $USER! You have played $GAMES_PLAYED games, and your best game took $GUESSES guesses."   
    
    READ_NUMBER
    #Metemos en la tabla games nuevo registro con este usuario:
    GAMES_PLAYED=$((GAMES_PLAYED+1))
    INSERT_DATA=$($PSQL "insert into games (user_id, games_played, guesses) values ((select id from users where username='$NAME'),$GAMES_PLAYED,$CONTA)") 

fi






