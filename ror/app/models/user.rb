class User < ApplicationRecord

  before_save :lowercase_email

  has_many :post

  def lowercase_email
    self.email = email.downcase
  end

  validates :email, presence: true, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/, message: 'Invalid email' }
  validates :password_digest, presence: true, length: { minimum: 4 }
  validates :first_name, presence: true, length: { maximum: 35, minimum: 1}
  validates :last_name, presence: true, length: { maximum: 35, minimum: 1}

  has_secure_password

end
