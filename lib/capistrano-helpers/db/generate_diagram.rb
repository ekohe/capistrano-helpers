namespace :db do
  desc <<-DESC
    Generate DB Diagram
  DESC

  # This could be a rake task, but anyway
  task :generate_diagram do
    on roles(:db) do
      run_locally do
        execute "RAILS_ENV=#{fetch(:environment)} rake generate_erd"
      end
    end
  end
end
