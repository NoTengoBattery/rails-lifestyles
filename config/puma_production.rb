project_name = "lifestyle_demo"
deploy_to = "/storage/home/rails/sites"
sockets = "/storage/home/webserver/sockets"
pids = "/storage/home/webserver/pid"
poject_path = "#{deploy_to}/#{project_name}"

# The environment this Puma is going to run on
environment ENV.fetch("RAILS_ENV") { "production" }
directory "#{poject_path}/current"

# Execute in daemon mode (deprecated, using systemd unit)
# daemonize true

# Bind to this UNIX socket for server, control
bind "unix://#{sockets}/#{project_name}.sock"
activate_control_app "unix://#{sockets}/#{project_name}_ctl.sock"

# Use this state path, pidfile
state_path "#{sockets}/#{project_name}.state"
pidfile "#{pids}/#{project_name}.pid"

# Redirect output to this file for out and err
stdout_redirect("#{poject_path}/shared/log/puma.log",
                "#{poject_path}/shared/log/puma.err.log")

# Other configuration
max_threads_count = ENV.fetch("RAILS_MAX_THREADS", 5)
min_threads_count = ENV.fetch("RAILS_MIN_THREADS") { max_threads_count }
concurrency_workers = ENV.fetch("WEB_CONCURRENCY", 4)

workers concurrency_workers
threads min_threads_count, max_threads_count
quiet
preload_app!
