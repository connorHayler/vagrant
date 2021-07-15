Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/xenial64"
  config.vm.define "db" do |db|
    db.vm.network "private_network", ip: "192.168.10.150"
    db.vm.provision "shell", path: "provisiondb.sh"
  end
 config.vm.define "app" do |app|  
    app.vm.network "private_network", ip: "192.168.10.100"
    app.vm.synced_folder "app", "/home/vagrant/task/app"
    app.vm.synced_folder "environment", "/home/vagrant/task/environment"
    app.vm.provision "shell", path: "provision.sh", env: {'DB_HOST' => 'mongodb://192.168.10.150:27017/posts'}
    # app.vm.provision "shell", path: "provision.sh"
 end
end
