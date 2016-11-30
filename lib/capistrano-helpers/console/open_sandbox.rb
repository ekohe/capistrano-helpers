namespace :console do
  desc <<-DESC
    Open console in sandbox mode on remote server
  DESC

  task :open_sandbox do
    on roles(:web) do
      run_rails_command_from_local('console -s')
    end
  end
end
