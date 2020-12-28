namespace :a_namespace do

  desc 'Dummy rake task'
  task dummy_task: [:environment] do
    puts "This is a dummy task"
  end
end