require_relative './concerns/controller_helper'

class ApplicationController < ActionController::Base
  include ControllerHelper
  helper_method :current_user
  # helper_method :find_bookmark
  helper_method :list_tags
  # helper_method :tutorial_name

  add_flash_types :success

  # def find_bookmark(id)
  #   current_user.user_videos.find_by(video_id: id)
  # end

  # def tutorial_name(id)
  #   Tutorial.find(id).title
  # end

end
