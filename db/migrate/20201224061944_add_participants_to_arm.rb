class AddParticipantsToArm < ActiveRecord::Migration[6.0]
  def change
    add_reference :participants, :arm
  end
end
