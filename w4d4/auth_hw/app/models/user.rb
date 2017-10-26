class User < ApplicationRecord
  validates :username, :session_token, presence: true
  validates :password_digest, presence: true

  def find_by_credentials(username,password)
    result = User.find_by(username: username)
    if result && BCrypt::Password.new(result.password_digest).is_password?(password)
      return result
    else
      nil
    end
  end

  def generate_session_token
    SecureRandom::urlsafe_base64(16)
  end

  def reset_session_token
    self.session_token = User.generate_session_token
    self.save!
    self.session_token
  end

  def ensure_session_token
    self.session_token ||= User.generate_session_token
  end

  def password=(pw)
    @password = pw
    self.password_digest = BCrypt::Password.create(pw)
  end

end
