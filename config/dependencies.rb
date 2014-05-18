set :dependencies, 'nginx' => {
	             repo_url: 'git@github.com/nginx/nginx.git',
		     branch:   'nginx-1.6',
		     script:   "#{current_path}/install/nginx.sh"
                   },
                   'go' => {
                     script:   "#{current_path}/install/go.sh"
		   }
