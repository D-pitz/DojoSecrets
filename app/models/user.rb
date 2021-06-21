class User < ActiveRecord::Base
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :name, presence: true, length: {minimum: 2} 
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: {with:EMAIL_REGEX}
  has_secure_password
end
