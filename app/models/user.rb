class User < ActiveRecord::Base
  VALID_EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  before_save { |user| user.email = user.email.downcase}
  before_create :create_remember_token
  has_secure_password

  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX},
            uniqueness: {case_sensitive: false}
  validates :password, length: { minimum: 6 }         

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.hash(token)
    Digest::SHA1.hexdigest(token.to_s)
  end
  private
    def create_remember_token
        self.remember_token = User.hash(User.new_remember_token)
      end
end
