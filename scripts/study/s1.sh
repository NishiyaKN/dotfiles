#read -p "Enter your name" $names

echo "Enter your names"
read -a names #-a is for arrays
echo "Your names are ${names[@]}" #@ is for all items
echo "The second one is ${names[1]}"

echo "Now enter your password"
read -s password #The -s is to not show whilst typing
echo "Your password is" $password

echo "You have 5 second to type anything"
read -t 5 var #-t is for time sensitive
echo "You typed" $var
