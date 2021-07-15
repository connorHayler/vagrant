sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install nginx -y
sudo apt-get install node.js -y
# sudo echo "export DB_HOST=mongodb://192.168.10.150:27017/posts" >> ~/.bashrc
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv D68FA50FEA312927
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt install nodejs -y
sudo npm install pm2 -g -y
systemctl status nginx
cd task/app/
npm install -y
cd /etc/nginx/sites-available
sudo rm -rf default
sudo echo "server{
        listen 80;
        server_name _;
        location / {
        proxy_pass http://192.168.10.100:3000;
        proxy_http_version 1.1;
        proxy_set_header Upgrade \$http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host \$host;
        proxy_cache_bypass \$http_upgrade;
        }
}" >> default
sudo nginx -t
cd /home/vagrant/task/app
sudo systemctl restart nginx
node seeds/seed.js
node app.js