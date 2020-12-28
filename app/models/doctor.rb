class Doctor < ApplicationRecord
  has_and_belongs_to_many :clinics
  
  has_many :appointments
  has_many :participants, through: :appointments
end
