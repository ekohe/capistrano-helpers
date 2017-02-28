namespace :db do
  desc <<-DESC
    Seed database
  DESC

  # This could be a rake task, but anyway
  task :seed do
    on roles(:db) do
      run_rake_command_from_local('db:seed')
    end
  end
end
