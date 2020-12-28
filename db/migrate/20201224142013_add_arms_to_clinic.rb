class AddArmsToClinic < ActiveRecord::Migration[6.0]
  def change
    add_reference :arms, :clinic
  end
end
