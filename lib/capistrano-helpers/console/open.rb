namespace :console do
  desc <<-DESC
    Open console on remote server
  DESC

  task :open do
    on roles(:web) do
      run_rails_command_from_local('console')
    end
  end
end
