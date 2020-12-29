namespace :create do

  desc 'Create Arms for a clinic'
  task :arm, [:clinic, :no_of_arms] => [:environment] do |t, args|
  
    clinic = Clinic.find_by_name(args[:clinic])
    return "Clinic not found" unless clinic

    no_of_arms = args[:no_of_arms].to_i

    (0...no_of_arms).each do |n|
      loop do
        begin
          arm = Arm.create(
            name: "Arm#{n}",
            limit: [100, 120, 130, 140, 150].sample,
            clinic_id: clinic.id
          )
  
          puts " Arm created successfully #{arm.name}"
        rescue => e
          puts " Unable to create arm, error: #{e.message}"
        end
      end
    end
  end
end