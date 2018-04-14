class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :users

  mount_uploader :prof_img, ImageUploader

  validates :profile, length: {maximum: 200}
  validates :nickname, presence: true

end
