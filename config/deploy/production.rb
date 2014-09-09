
set :stage, :production
# role :web, "133.242.202.62:22"  #デプロイ先SSHポートを指定（デフォルトは22）
role :app, %w{taishi@133.242.202.62}
role :web, %w{taishi@133.242.202.62}
role :db, %w{taishi@133.242.202.62}

set :ssh_options, {
  #  keys: %w(/Users/taish/.ssh/id_rsa.pub),
   forward_agent: false,
   auth_methods: %w(password),
  #  auth_methods: %w(publickey) # 認証方法 passwordも可能
  password: 'taishi' #password指定
 }
# set :application, 'TwiGarage'
# set :repo_url, 'git@github.com:taish/TwiGarage.git'
#
# task :update do
#   run_locally do
#     application = fetch :application
#     if test "[ -d #{application} ]"
#       execute "cd #{application}; git pull"
#       # end
#     else
#       execute "git clone #{fetch :repo_url} #{application}"
#     end
#   end
# end




# 以下 default


# Simple Role Syntax
# ==================
# Supports bulk-adding hosts to roles, the primary server in each group
# is considered to be the first unless any hosts have the primary
# property set.  Don't declare `role :all`, it's a meta role.

# role :app, %w{deploy@example.com}
# role :web, %w{deploy@example.com}
# role :db,  %w{deploy@example.com}


# Extended Server Syntax
# ======================
# This can be used to drop a more detailed server definition into the
# server list. The second argument is a, or duck-types, Hash and is
# used to set extended properties on the server.

# server 'example.com', user: 'deploy', roles: %w{web app}, my_property: :my_value


# Custom SSH Options
# ==================
# You may pass any option but keep in mind that net/ssh understands a
# limited set of options, consult[net/ssh documentation](http://net-ssh.github.io/net-ssh/classes/Net/SSH.html#method-c-start).
#
# Global options
# --------------
#  set :ssh_options, {
#    keys: %w(/home/rlisowski/.ssh/id_rsa),
#    forward_agent: false,
#    auth_methods: %w(password)
#  }
#
# And/or per server (overrides global)
# ------------------------------------
# server 'example.com',
#   user: 'user_name',
#   roles: %w{web app},
#   ssh_options: {
#     user: 'user_name', # overrides user setting above
#     keys: %w(/home/user_name/.ssh/id_rsa),
#     forward_agent: false,
#     auth_methods: %w(publickey password)
#     # password: 'please use keys'
#   }
