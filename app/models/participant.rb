class Participant < ApplicationRecord

  belongs_to :arm, optional: true

  has_many :appointments
  has_many :doctors, through: :appointments

  validates :name, :age, :gender, presence: true

  validates :gender, inclusion: { in: ['Male', 'Female'],
    message: 'Gender must be either male or female'}

  validates :name, uniqueness: { case_sensitive: false }

  before_validation :handle_gender

  private

  def handle_gender
    self.gender = (self.gender.downcase.in? ['male', 'm']) ? 'Male' : self.gender
    self.gender = (self.gender.downcase.in? ['female', 'f']) ? 'Female' : self.gender
  end
end




# A participant will belong to an arm, so for that we will add a reference id in participant,
