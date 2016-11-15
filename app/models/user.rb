# class User
class User < ActiveRecord::Base
  has_secure_password
  has_many :reviews
  # has_many :orders
  validates :password_confirmation, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :first_name, presence: true
  validates :last_name, presence: true

  def self.authenticate_with_credentials(email, password)
    user = User.where('lower(email) = ?', email.strip.downcase).first
    # user = User.find_by_email(email.strip)
    user && user.authenticate(password) ? user : nil
  end
end
