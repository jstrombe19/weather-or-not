class User < ApplicationRecord
  has_many :routes
  validates :password, length: {
    min: 7,
    max: 20
  }
  validates :email, uniqueness: true
end
