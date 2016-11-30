namespace :db do
  desc 'Make a dump of database on server'
  task :dump do
    on roles(:db) do
      env = fetch(:stage).to_s
      dump_dir = "#{deploy_path}/shared/dump"

      run_as_www_data "mkdir -p #{dump_dir}"

      dump_file = "#{env}_#{Time.now.strftime('%Y_%m_%d-%H_%M_%S-%6N')}.gz"
      dump_path = [dump_dir, dump_file].join('/')

      db_yml = capture("cat #{deploy_path}/shared/config/database.yml")
      db_config = YAML.load(db_yml)[env]

      password, username, database = db_config.values_at('password', 'username', 'database')

      execute "PGPASSWORD=#{password} /usr/bin/env pg_dump -U #{username} #{database} | gzip > #{dump_path}"
    end
  end
end
