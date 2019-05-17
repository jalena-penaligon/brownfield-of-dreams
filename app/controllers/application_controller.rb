class ApplicationController < ActionController::Base
  helper_method :current_user
  # helper_method :find_bookmark
  helper_method :list_tags
  # helper_method :tutorial_name

  add_flash_types :success

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  # def find_bookmark(id)
  #   current_user.user_videos.find_by(video_id: id)
  # end

  # def tutorial_name(id)
  #   Tutorial.find(id).title
  # end

  def four_oh_four
    render :file => "#{Rails.root}/public/404.html", layout: false, status: :not_found
  end
end
