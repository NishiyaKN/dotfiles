#!bin/bash

cd /home/teruyo/re/git/tcc-amicao
git pull
echo "Do you want to continue?"
read YN
if [ $YN == "y" ] || [ $YN == "Y" ]; then
cp -r /home/teruyo/AndroidStudioProjects/tcc-amicao/App/Amicacina/* /home/teruyo/re/git/tcc-amicao/App/Amicacina/
git add .
git commit -m "UI fixes"
git push origin main
fi
