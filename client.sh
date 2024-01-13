sudo apt update
#sudo apt upgrade
#rm -rf first_react_app
#git clone https://github.com/Kal1-linux/first_react_app.git
#cd first_react_app
sudo npm i
sudo npm install serve -g
sudo rm -rf /usr/lib/node_modules/pm2
sudo npm install pm2 -g
npm run build
#pm2 stop frontend
#pm2 delete frontend
#pm2 start "serve -s build" --name "frontend"
pm2 start "serve -s build -l 5000" --name "frontend"
pm2 save
#pm2 logs


#pm2 start "npm start" --name "frontend"

# Get the process ID (PID) of the most recently started process
latest_pid=$(pm2 prettylist | grep -E '"name":"Api_v2".*?"pm_id":([0-9]+)' | sed -E 's/.*"pm_id":([0-9]+),.*/\1/' | tail -n 1)

# Stop and delete all processes except the most recently started one
pm2 delete all
pm2 resurrect $latest_pid

