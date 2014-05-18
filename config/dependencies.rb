set :dependencies, { 'nginx' => {
                       :repo_url => 'https://github.com/nginx/nginx.git',
	               :branch   => 'nginx-1.6',
		       :script   => "/srv/home/current/install/nginx.sh"
                     },
                     'go' => {
                       :source_dir => "/srv/home/current/install",
                       :script     => "/srv/home/current/install/go.sh"
                     }
                   }
