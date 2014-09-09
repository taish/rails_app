# framework_tasks = [:starting, :started, :updating, :updated, :publishing, :published, :finishing, :finished]
#
# framework_tasks.each do |t|
#   Rake::Task["deploy:#{t}"].clear
# end

# config valid only for Capistrano 3.1
# lock '3.1.0'

lock '3.2.1'

set :application, 'TwiGarage'
set :repo_url, 'git@github.com:taish/TwiGarage.git'
# set :repo_url, 'git@github.com:xxxx.git'
set :deploy_to, '/home/taishi/app'
set :keep_releases, 5

set :rbenv_path, '/home/taishi/.rbenv'
set :rbenv_type, :system # :system or :user
set :rbenv_ruby, '2.1.2'
set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"
set :rbenv_map_bins, %w{rake gem bundle ruby rails}
set :rbenv_roles, :all # default value

set :linked_dirs, %w{bin log tmp/backup tmp/pids tmp/cache tmp/sockets vendor/bundle}
set :unicorn_pid, "#{shared_path}/tmp/pids/unicorn.pid"

set :whenever_identifier, ->{ "#{fetch(:application)}_#{fetch(:stage)}" }

after 'deploy:publishing', 'deploy:restart'
namespace :deploy do
  task :restart do
    invoke 'unicorn:restart'
  end
end


# set :application, 'アプリ名'
# set :repo_url, 'cloneしてくるレポジトリのURL.git'
# set :branch, 'master' # デフォルトがmasterなのでこの場合書かなくてもいいです。
# set :deploy_to, "/home/taishi/Twigarage"
# # set :scm, :git # capistrano3からgitオンリーになった気がするのでいらないかも?
#
# set :format, :pretty
# set :log_level, :debug # :info or :debug
# set :keep_releases, 3 # 何世代前までリリースを残しておくか

# set :rbenv_type, :user
# set :rbenv_ruby, '2.1.1'
# set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"
# set :rbenv_map_bins, %w{rake gem bundle ruby rails}
# set :rbenv_roles, :all # default value



# 以下 デフォルト
# Rake::Task[:deploy].clear

# config valid only for Capistrano 3.1
# lock '3.2.1'

# set :application, 'my_app_name'
# set :repo_url, 'git@example.com:me/my_repo.git'

# Default branch is :master
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }.call

# Default deploy_to directory is /var/www/my_app
# set :deploy_to, '/var/www/my_app'

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
set :pty, true

# Default value for :linked_files is []
# set :linked_files, %w{config/database.yml}

# Default value for linked_dirs is []
# set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

# namespace :deploy do
#
#   desc 'Restart application'
#   task :restart do
#     on roles(:app), in: :sequence, wait: 5 do
#       # Your restart mechanism here, for example:
#       # execute :touch, release_path.join('tmp/restart.txt')
#     end
#   end

#   after :publishing, :restart
#
#   after :restart, :clear_cache do
#     on roles(:web), in: :groups, limit: 3, wait: 10 do
#       # Here we can do anything such as:
#       # within release_path do
#       #   execute :rake, 'cache:clear'
#       # end
#     end
#   end
#
# end
