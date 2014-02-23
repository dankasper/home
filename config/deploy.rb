# config valid only for Capistrano 3.1
lock '3.1.0'

set :application, 'danielkasper.net'
set :repo_url,    'git@github.com:dankasper/home.git'
set :deploy_to,   '/srv/home'
set :default_env, path:   "#{deploy_to}/sbin:#{deploy_to}/go/bin",
                  goroot: "#{deploy_to}/go"

namespace :deploy do

  before :restart, :stop_nginx do
    on roles(:app) do
      execute <<-COMMAND
        cd #{deploy_to}
	if [ -f logs/nginx.pid ]
    	  then sbin/nginx -s stop
	fi
      COMMAND
    end
  end

  desc 'Restart application'
  task :restart do
    on roles(:app) do
      within fetch(:deploy_to) do
        execute 'nginx'
      end
    end
  end

  after :publishing, :restart

end
