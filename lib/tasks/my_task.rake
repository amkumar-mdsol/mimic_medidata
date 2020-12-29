namespace :enroll do

  desc 'Dummy rake task'
  task :participants, [:clinic, :no_of_participants] => [:environment] do |t, args|
    puts "clinic: #{args[:clinic]}, no of participants: #{args[:no_of_participants]}"
    clinic = Clinic.find_by_name(args[:clinic])
    return "Clinic not found" unless clinic
    no_of_participants = args[:no_of_participants].to_i

    # create participants
    (0...no_of_participants).each do |n|
      participant = Participant.new(
        name: "participant#{SecureRandom.urlsafe_base64(4)}",
        age: (10..100).to_a.sample,
        gender: ['male', 'female'].sample
      )
      begin
        participant.save!
        puts "Participant created successfully with name: #{participant.name}"
      rescue => e
        puts "Falied to create participant due to: #{participant.errors.full_messages}"
      end
    end
  end

  desc 'Randomly assign participants to arms'
  task :assign_participants_to_arms, [:clinic] => [:environment] do |t, args|
    clinic = Clinic.find_by_name(args[:clinic])
    return "Clinic not found" unless clinic

    clinic.arms.each do |arm|
      remaining_limit = arm.limit - arm.participants.count
      (0...remaining_limit).each do |n|
        participant = Participant.where(arm_id: nil).sample
        break unless participant
        participant.arm = arm
        participant.save!
        puts "Participant with name: #{participant.name} is assigned to: #{arm.name}"
      end
    end
  end
end



# clinic we have to populate the arms
# how many participants to enroll


# we will be creating those no of participants

# we will be randomly take participant one by one and assign it to an arm

# limit on the arms will be different 

# can't enroll more participants

