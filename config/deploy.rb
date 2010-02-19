# target name

set :application, "www.barcelonaonrails.com"
set :deploy_to, "/var/www/#{application}"
set :user, "web"
set :repository, "http://github.com/jrd/bcnonrails.git"
set :deploy_via, :remote_cache
set :copy_exclude, [".git", ".gitignore"]
set :scm, :git

ssh_options[:forward_agent] = true

role :app, "www.barcelonaonrails.com"
role :web, "www.barcelonaonrails.com"
role :db,  "www.barcelonaonrails.com", :primary => true

# restart the app
set :mongrel_config, "/etc/mongrel_cluster/www_barcelonaonrails_com.yml"

namespace :deploy do
 task :restart do
   # restart mongrel
   sudo "mongrel_rails cluster::restart -C #{mongrel_config}"
 end
end