def run_rails_command_from_local(cmd)
  execute <<-CMD.gsub(/\s+/,' ').strip
    ssh #{fetch(:user)}@#{fetch(:server)} -t -t \
    'sudo -u www-data bash -c "source /usr/local/lib/rvm; \
    rvm #{fetch(:rvm_ruby_string)}; \
    umask 0002; \
    cd #{fetch(:deploy_to)}/current; \
    RAILS_ENV=#{fetch(:environment)} bundle exec rails #{cmd}"'
  CMD
end

def run_rake_command_from_local(cmd)
  execute <<-CMD.gsub(/\s+/,' ').strip
    ssh #{fetch(:user)}@#{fetch(:server)} -t -t \
    'sudo -u www-data bash -c "source /usr/local/lib/rvm; \
    rvm #{fetch(:rvm_ruby_string)}; \
    umask 0002; \
    cd #{fetch(:deploy_to)}/current; \
    RAILS_ENV=#{fetch(:environment)} bundle exec rake #{cmd}"'
  CMD
end

def run_as_www_data(cmd)
  execute <<-CMD.gsub(/\s+/, ' ').strip
    sudo -u www-data bash -c
    '
       source /usr/local/lib/rvm;
       rvm #{fetch(:rvm_ruby_string)};
       umask 0002;
       cd #{fetch(:deploy_to)}/current;
       #{cmd}
    '
  CMD
end

def truncate_all_tables(username, password, database)
  execute <<-CMD.gsub(/\s+/, ' ').strip
    PGPASSWORD=#{password} psql -U #{username} #{database} -t -c \
      "
        select 'drop table if exists \\"' || tablename || '\\" cascade;'
        from pg_tables
        where schemaname = 'public';
      " \
    | PGPASSWORD=#{password} psql -U #{username} #{database}
  CMD
end
