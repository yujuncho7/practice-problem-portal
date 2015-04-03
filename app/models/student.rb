require 'bcrypt'

class Student < ActiveRecord::Base
  attr_accessible :email, :hashed_password, :password, :password_confirmation
  include BCrypt

  # validates_length_of :password, :minimum => 7, :maximum => 20, :allow_blank => false
  # validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  
  def is_instructor?
  	return false
  end

  def password
    @password ||= Password.new(hashed_password)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.hashed_password = @password
  end

end
