require 'capistrano/setup'
require 'capistrano/deploy'
require 'capistrano/rails'
require 'capistrano/rails/assets'
require 'capistrano/rails/migrations'
require 'capistrano/rbenv'
require 'capistrano/bundler'
require 'capistrano3/unicorn'
require 'whenever/capistrano'

Dir.glob('lib/capistrano/tasks/*.rake').each { |r| import r }

# Load DSL and Setup Up Stages
# require 'capistrano/setup'

# Includes default deployment tasks
# require 'capistrano/deploy'

# Includes tasks from other gems included in your Gemfile
#
# For documentation on these, see for example:
#
#   https://github.com/capistrano/rvm
#   https://github.com/capistrano/rbenv
#   https://github.com/capistrano/chruby
#   https://github.com/capistrano/bundler
#   https://github.com/capistrano/rails
#
# require 'capistrano/rvm'
# require 'capistrano/rbenv'
# require 'capistrano/chruby'
# require 'capistrano/bundler'
# require 'capistrano/rails/assets'
# require 'capistrano/rails/migrations'

# Loads custom tasks from `lib/capistrano/tasks' if you have any defined.
# Dir.glob('lib/capistrano/tasks/*.rake').each { |r| import r }



# capistranoの出力がカラーになる
# require 'capistrano_colors'

# Loads custom tasks from `lib/capistrano/tasks' if you have any defined.
# Dir.glob('lib/capistrano/tasks/*.rake').each { |r| import r }


# cap deploy時に自動で bundle install が実行される
# require "bundler/capistrano"

# RVMを利用している場合は必要
# $:.unshift(File.expand_path('./lib', ENV['rvm_path']))
# require 'rvm/capistrano'
# set :rvm_ruby_string, '1.9.2'
# set :rvm_type, :user

# リポジトリの設定
# set :application, 'TwiGarage'
# set :repository, 'git@github.com:taish/TwiGarage.git'
# set :scm, :git
# set :branch, "master"
# set :deploy_via, :remote_cache
# set :deploy_to, "/var/www/#{application}"
# set :rails_env, "production"
#
# role :web, "133.242.202.62:22"  #デプロイ先SSHポートを指定（デフォルトは22）
# role :app, "133.242.202.62:22"
# role :db, "133.242.202.62:22"
#
# # SSHの設定
# set :user, "taishi"
# ssh_options[:port] = "22"
# ssh_options[:forward_agent] = true
# default_run_options[:pty] = true

# cap deploy:setup 後、/var/www/ の権限変更
# namespace :setup do
#   task :fix_permissions do
#     sudo "chown -R #{user}.#{user} #{deploy_to}"
#   end
# end
# after "deploy:setup", "setup:fix_permissions"

# Unicorn用に起動/停止タスクを変更
# namespace :deploy do
#   task :start, :roles => :app do
#     run "cd #{current_path}; bundle exec unicorn_rails -c config/unicorn.rb -E #{rails_env} -D"
#   end
#   task :restart, :roles => :app do
#     if File.exist? "/tmp/unicorn_#{application}.pid"
#       run "kill -s USR2 `cat /tmp/unicorn_#{application}.pid`"
#     end
#   end
#   task :stop, :roles => :app do
#     run "kill -s QUIT `cat /tmp/unicorn.pid`"
#   end
# end

# Rails3.1.1のProduction用
# namespace :assets do
#   task :precompile, :roles => :web do
#     run "cd #{current_path} && RAILS_ENV=production bundle exec rake assets:precompile"
#   end
#   task :cleanup, :roles => :web do
#     run "cd #{current_path} && RAILS_ENV=production bundle exec rake assets:clean"
#   end
# end
# after :deploy, "assets:precompile"
