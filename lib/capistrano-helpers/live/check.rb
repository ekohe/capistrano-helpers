namespace :live do
  desc 'Check if your local copy is deployed to the server'
  task :check do
    on roles(:web) do
      env = fetch(:stage).to_s
      puts "Server revision:"
      server = capture("cat #{deploy_path}/current/REVISION")
      puts server
      begin
        if env == 'staging'
          puts "Git origin/staging:"
          local = system("git rev-parse origin/staging")
        else
          puts "Git origin/master:"
          local = system("git rev-parse origin/master")
        end
        if server != local
          puts "You should deploy"
        else
          puts "Everything already deployed"
        end
      rescue
        puts "Error"
      end
    end
  end
end
