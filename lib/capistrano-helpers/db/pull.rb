namespace :db do
  desc 'Combination of db:dump and db:restore_to_local'
  task :pull do
    on roles(:db) do
      invoke 'db:dump'
      invoke 'db:restore_to_local'
    end
  end
end
