worker_processes  3
working_directory '/home/taishi/app/current'

listen  '/home/taishi/app/current/tmp/unicorn.sock', :backlog => 64
pid     '/home/taishi/app/current/tmp/unicorn.pid'

# log = '/var/log/rails/unicorn.log'
stderr_path File.expand_path('log/unicorn_stderr.log', ENV['RAILS_ROOT'])
stdout_path File.expand_path('log/unicorn_stdout.log', ENV['RAILS_ROOT'])

preload_app true

before_fork do |server, worker|
 defined?(ActiveRecord::Base) and ActiveRecord::Base.connection.disconnect!

 old_pid = "#{ server.config[:pid] }.oldbin"
 unless old_pid == server.pid
  begin
   Process.kill :QUIT, File.read(old_pid).to_i
   rescue Errno::ENOENT, Errno::ESRCH
  end
 end
end

after_fork do |server, worker|
 defined?(ActiveRecord::Base) and ActiveRecord::Base.establish_connection
end
