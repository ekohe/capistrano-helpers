namespace :db do

  desc <<-DESC
    1. Genereate DB Diagram
  DESC
  task :generate_db_diagram => "db:helpers:generate_db_diagram"

  namespace :helpers do
    task :generate_db_diagram do
      on roles(:web) do |host|
        run_locally do
          execute "RAILS_ENV=#{fetch(:environment)} rake generate_erd"
        end
      end
    end
  end
end

