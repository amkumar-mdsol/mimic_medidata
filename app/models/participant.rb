class Participant < ApplicationRecord

  belongs_to :arm

  validates :name, :age, :gender, presence: true

  validates :gender, inclusion: { in: ['Male', 'Female'],
    message: 'Gender must be either male or female'}

  validates :name, uniqueness: { case_sensitive: false }
  validate :method_in_validation

  before_validation :handle_gender
  after_validation :method_after_validation
  before_save :method_before_save
  after_save :method_after_save
  before_create :method_before_create
  after_create :method_after_create
  # before_update: method_before_update
  # after_update: method_after_update

  private

  def handle_gender
    self.gender = (self.gender.downcase.in? ['male', 'm']) ? 'Male' : self.gender
    self.gender = (self.gender.downcase.in? ['female', 'f']) ? 'Female' : self.gender
  end

  def method_in_validation
    puts "********************************"
    puts "We are in validation"
    puts "*********************************"
  end

  def method_after_validation
    puts "+++++++++++++++++++++++++++++++++"
    puts "We are in after validation method"
    puts "+++++++++++++++++++++++++++++++++"
  end

  def method_before_save
    puts "+++++++++++++++++++++++++++++++++"
    puts "We are in before save method"
    puts "+++++++++++++++++++++++++++++++++"
  end

  def method_after_save
    puts "+++++++++++++++++++++++++++++++++"
    puts "We are in after save method"
    puts "+++++++++++++++++++++++++++++++++"
  end

  def method_before_create
    puts "+++++++++++++++++++++++++++++++++"
    puts "We are in before create method"
    puts "+++++++++++++++++++++++++++++++++"

  end

  def method_after_create
    puts "+++++++++++++++++++++++++++++++++"
    puts "We are in after create method"
    puts "+++++++++++++++++++++++++++++++++"
  end
end




# A participant will belong to an arm, so for that we will add a reference id in participant,
