class User < ActiveRecord::Base
  has_secure_password
  before_create :create_remember_token

  has_many :favorite_user_relations, foreign_key: :from_id
  has_many :favorite_users, through: :favorite_user_relations, source: :to
  has_many :reports

  def self.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def self.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

  def create_remember_token
    self.remember_token = User.encrypt(User.new_remember_token)
  end
end
