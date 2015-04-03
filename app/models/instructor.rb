require 'bcrypt'

class Instructor < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation
  has_secure_password
  include BCrypt

  before_save { |user| user.email = email.downcase }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence: true,
                    length: { maximum: 50 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6, maximum: 20}
  validate :confirm?

  def confirm?
    return password_confirmation == password
  end

  def is_instructor?
    return true
  end
end
