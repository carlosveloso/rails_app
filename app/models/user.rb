class User < ActiveRecord::Base
	VALID_EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

	before_save	{ |user| user.email = user.email.downcase}
	has_secure_password

	validates :name, presence: true, length: { maximum: 50 }
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX},
						uniqueness: {case_sensitive: false}
	validates :password, length: { minimum: 6 }					
end
