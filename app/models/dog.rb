class Dog < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :liking_users, :through => :likes, :source => :user

  after_save(on: :create) do
      Like.create(dog_id:self.id, user_id:self.user_id)
  end
end
