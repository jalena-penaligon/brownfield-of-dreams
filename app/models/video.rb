class Video < ApplicationRecord
  has_many :user_videos
  has_many :users, through: :user_videos
  belongs_to :tutorial
  validates :position, presence: true, numericality: { greater_than: -1 }

end
