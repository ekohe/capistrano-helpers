namespace :db do
  desc <<-DESC
    Reset database
  DESC

  task :reset do
    on roles(:db) do
      run_rake_command_from_local('db:reset')
    end
  end
end
