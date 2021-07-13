sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install nginx -y
sudo apt-get install node.js -y
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
sudo apt install nodejs -y
sudo npm install pm2 -g -y
systemctl status nginx
cd task/app/
npm install -y
npm start
npm run