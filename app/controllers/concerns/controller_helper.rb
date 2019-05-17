module ControllerHelper
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def four_oh_four
    render :file => "#{Rails.root}/public/404.html", layout: false, status: :not_found
  end

  def require_admin!
    if current_user.nil?
      four_oh_four
    else
      four_oh_four unless current_user.admin?
    end
  end
end
