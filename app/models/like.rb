class Like < ApplicationRecord
  belongs_to :dog
  belongs_to :user
  validates :dog, uniqueness: { scope: :user,
    message: "dog already liked" }
end
