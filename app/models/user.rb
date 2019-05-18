# frozen_string_literal: true

class User < ApplicationRecord
  include BookmarksHelper

  has_many :user_videos
  has_many :videos, through: :user_videos
  has_many :friendships

  validates :email, uniqueness: true, presence: true
  validates_presence_of :password
  validates_presence_of :first_name
  enum role: %i[default admin]
  has_secure_password

  def friendships?
    friendships.count.positive?
  end

  def friend?(user_login)
    friendships.any? do |friend|
      friend.friend_login == user_login
    end
  end

  def retrieve_bookmarks
    user_videos.joins(video: :tutorial)
               .select('tutorials.title as tutorial_title,
                        tutorials.id as tutorial_id,
                        videos.id,
                        videos.title')
               .order('tutorials.id, videos.position')
  end

  def confirmation_token
    self.confirm_token = SecureRandom.urlsafe_base64.to_s if confirm_token.nil?
  end
end
