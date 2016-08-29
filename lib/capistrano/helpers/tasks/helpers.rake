namespace :db do
  desc <<-DESC
    Genereate DB Diagram
  DESC

  task :generate_diagram do
    on roles(:web) do |host|
      run_locally do
        execute "RAILS_ENV=#{fetch(:environment)} rake generate_erd"
      end
    end
  end
end

namespace :console do
  desc <<-DESC
    Open console on remote
  DESC

  task :open do
    on roles(:web) do |host|
      exec console_command
    end
  end

  task :open_sandbox do
    on roles(:web) do |host|
      exec console_command(" -s")
    end
  end
end

def console_command(flags='')
  cmd = <<CMD.gsub(/\s+/,' ').strip
    ssh #{fetch(:user)}@#{fetch(:server)} -t -t \
    'sudo -u www-data bash -c "source /usr/local/lib/rvm; \
    rvm #{fetch(:rvm_ruby_string)}; \
    umask 0002; \
    cd #{fetch(:deploy_to)}/current; \
    RAILS_ENV=#{fetch(:environment)} bundle exec rails console#{flags}"'
CMD
end
