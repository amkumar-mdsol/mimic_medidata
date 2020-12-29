class Arm < ApplicationRecord

  belongs_to :clinic
  
  has_many :participants

  validates :limit, numericality: { only_integer: true }
end
