namespace :mimic_medidata do

  desc 'setup env variables'
  task :setup => [:environment] do
    puts 'Setup environment variables'
  end

  desc 'seed database'
  task :seed => [:environment] do
    puts 'Seed the database'
  end
end