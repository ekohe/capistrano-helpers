namespace :db do
  desc 'Restore local database from the latest remote server dump'
  task :restore_to_local do
    on roles(:app) do |host|
      remote_dump_path = capture("ls -t1 #{deploy_path}/shared/dump/*.gz | head -1").strip
      raise 'no dump found, please dump the database first!' unless remote_dump_path.length > 0

      local_dump_path = "dump/#{File.basename(remote_dump_path)}"

      run_locally do
        FileUtils.mkdir_p 'dump'
        execute "scp #{host}:#{remote_dump_path} #{local_dump_path}"

        db_yml_path = 'config/database.yml'
        db_config = YAML.load_file(db_yml_path)['development']
        password, username, database = db_config.values_at('password', 'username', 'database')

        truncate_all_tables(username, password, database)
        execute "gunzip -c #{local_dump_path} | PGPASSWORD=#{password} psql -U #{username} #{database}"
      end
    end
  end
end
