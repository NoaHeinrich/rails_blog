require "bcrypt"
class User < ActiveRecord::Base
  has_many :posts
  validates :email, :password_hash, { presence: true }
  validates :email, uniqueness: true
  validates :email, format: { with: /\w+@\w+.\w{2,3}/i }

  def password
    @password ||= BCrypt::Password.new(password_hash)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.password_hash = @password
  end

  def authenticate(email, password)
    self.password == password && self.email == email
  end
end
