# frozen_string_literal: true

class FriendshipsController < ApplicationController
  def create
    begin
      friend_id = User.find_by(github_login: params[:friend_login]).id
      create_friendship(friend_id, params, current_user)
      flash[:success] = "You are now friends with #{params[:friend_login]}"
    rescue StandardError
      flash[:error] = 'Invalid input'
    end
    redirect_to dashboard_path
  end

  private

  def create_friendship(friend_id, params, current_user)
    friendship = Friendship.create!(user_id: current_user.id,
                                    friend_id: friend_id,
                                    friend_login: params[:friend_login])
    current_user.friendships << friendship
  end
end
