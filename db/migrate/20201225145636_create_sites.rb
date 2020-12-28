class CreateSites < ActiveRecord::Migration[6.0]
  def change
    create_table :sites do |t|
      t.string  :name
      t.string  :site_uuid
      t.string  :location
      t.string  :phone
      t.string  :email
      t.string  :study_uuid
      t.timestamps
    end
  end
end
