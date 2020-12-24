class Arm < ApplicationRecord

  has_many :participants

  validates :limit, numericality: { only_integer: true }
end
