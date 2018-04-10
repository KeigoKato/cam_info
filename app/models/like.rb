class Like < ApplicationRecord
  validates :user_id, presence: true
  validates :picture_id, presence: true

  belongs_to :user
  belongs_to :picture
end
