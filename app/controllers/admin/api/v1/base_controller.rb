class Admin::Api::V1::BaseController < ActionController::API
  before_action :require_admin!

  def require_admin!
    if current_user.nil?
      four_oh_four
    elsif
      four_oh_four unless current_user.admin?
    end
  end

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    else
      @current_user ||= User.new
    end
  end

  def four_oh_four
    render :file => "#{Rails.root}/public/404.html", layout: false, status: :not_found
  end
end
