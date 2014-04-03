# bundle exec unicorn_rails -c config/unicorn.rb -E production -D

# See http://unicorn.bogomips.org/Unicorn/Configurator.html for complete
# documentation.

rails_env = ENV['RAILS_ENV'] || 'production'

case rails_env
when 'production'
  base_path = '/home/shepherd/public_html/www.rccxm.com'
  worker_processes 2
else
  base_path = '/home/shepherd/public_html/staging.rccxm.com'
  worker_processes 2
end

# Help ensure your application will always spawn in the symlinked
# "current" directory that Capistrano sets up.
working_directory "#{base_path}/current"

# Load rails into the master before forking workers
# for super-fast worker spawn times
preload_app false

# Restart any workers that haven't responded in 60 seconds
timeout 60

# Listen on a Unix data socket
listen "#{base_path}/shared/sockets/unicorn.sock"

# feel free to point this anywhere accessible on the filesystem
pid "#{base_path}/shared/pids/unicorn.pid"

# By default, the Unicorn logger will write to stderr.
# Additionally, ome applications/frameworks log to stderr or stdout,
# so prevent them from going to /dev/null when daemonized here:
stderr_path "#{base_path}/shared/log/unicorn.stderr.log"
stdout_path "#{base_path}/shared/log/unicorn.stdout.log"

before_fork do |server, worker|
  # This allows a new master process to incrementally
  # phase out the old master process with SIGTTOU to avoid a
  # thundering herd (especially in the "preload_app false" case)
  # when doing a transparent upgrade.  The last worker spawned
  # will then kill off the old master process with a SIGQUIT.
  old_pid = "#{server.config[:pid]}.oldbin"
  if old_pid != server.pid
    begin
      sig = (worker.nr + 1) >= server.worker_processes ? :QUIT : :TTOU
      Process.kill(sig, File.read(old_pid).to_i)
    rescue Errno::ENOENT, Errno::ESRCH
      # someone else did our job for us
    end
  end
end

# after_fork do |server, worker|
#   # per-process listener ports for debugging/admin/migrations
#   addr = "127.0.0.1:#{9200 + worker.nr}"
#   server.listen(addr, :tries => -1, :delay => 5, :tcp_nopush => true)
# end

