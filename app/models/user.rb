class User < ApplicationRecord
  has_secure_password
  has_many :likes, dependent: :delete_all
  has_many :dogs, dependent: :delete_all
  has_many :liked_dogs, :through => :likes, :source => :dog

  validates :name, :email, :password, presence: true
  validates :email, uniqueness: true
end
