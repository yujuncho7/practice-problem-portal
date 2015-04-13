class Student < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :completed_problems
  serialize :completed_problems

  validate :confirm?

  def confirm?
    return password_confirmation == password
  end

  def is_instructor?
    return false
  end

end
