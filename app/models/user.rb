class User < ApplicationRecord
  validates :name, presence: true
  validates :password, presence: true, length: { minimum: 8 }
  EMAIL_REGEX =  /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, format: { with: EMAIL_REGEX, message: "Email must be properly formatted" }

  has_secure_password
end
