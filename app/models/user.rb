class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # validates :handle, uniqueness: true, presence: true
  acts_as_voter
  mount_uploader :photo, PhotoUploader
end
