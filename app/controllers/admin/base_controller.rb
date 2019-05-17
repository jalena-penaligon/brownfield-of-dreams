class Admin::BaseController < ApplicationController
  before_action :require_admin!

  def require_admin!
    if current_user.nil?
      four_oh_four
    else
      four_oh_four unless current_user.admin?
    end   
  end
end
