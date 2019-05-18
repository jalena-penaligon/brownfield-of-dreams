# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include ControllerHelper
  helper_method :current_user
  helper_method :list_tags
  add_flash_types :success
end
