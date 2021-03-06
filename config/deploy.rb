# config valid only for Capistrano 3.1
lock '3.1.0'

set :application, 'danielkasper.net'
set :repo_url,    'git@github.com:dankasper/home.git'
set :deploy_to,   '/srv/home'
set :default_env, path:   "#{deploy_to}/sbin:#{deploy_to}/go/bin:$PATH",
                  goroot: "#{deploy_to}/go"

namespace :deploy do

  task :update_config do
    on roles(:app) do
      execute :cp, "#{current_path}/config/nginx.conf", "#{deploy_to}/conf"
    end
  end

  task :stop_nginx do
    on roles(:app) do
      execute <<-COMMAND
        cd #{deploy_to}
        if [ -f logs/nginx.pid ]
           then sbin/nginx -s stop
        fi
      COMMAND
    end
  end
  before :stop_nginx, :update_config

  desc 'Restart application'
  task :restart => :stop_nginx do
    on roles(:app) do
      execute 'go', 'run', "#{current_path}/src/static.go", '&'
      within fetch(:deploy_to) do
        execute 'nginx'
      end
    end
  end

  after :publishing, :restart

end
