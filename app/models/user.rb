class User < ApplicationRecord
  has_secure_password
  has_secure_token :password_reset_token

  validates :email, presence: true, uniqueness: true

  def update_last_logged_in!
    self.last_logged_in = Time.now
    self.save!
  end
end
