sudo apt update
#sudo apt upgrade
#rm -rf first_react_app
#git clone https://github.com/Kal1-linux/first_react_app.git
#cd first_react_app
sudo npm i
sudo npm install serve -g
sudo npm install pm2 -g
pm2 stop frontend
pm2 delete frontend
npm run build
#pm2 start "serve -s build" --name "frontend"
pm2 start "serve -s build -l 5000" --name "Frontend"
#pm2 logs