Vagrant.configure(2) do |config|
  config.vm.box = 'ubuntu/trusty64'
  config.vm.hostname = 'django-live'

  config.vm.network 'forwarded_port', guest: 8000, host: 8000, auto_correct: true

  config.vm.synced_folder '.', '/home/vagrant/project'
  config.vm.synced_folder '~/.ssh', '/home/vagrant/.ssh'

  config.ssh.forward_agent = true

  config.vm.provider 'virtualbox' do |vb|
    vb.gui = false
    vb.memory = '2048'
    vb.cpus = 2
  end
end
