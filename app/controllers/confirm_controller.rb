class ConfirmController < ApplicationController

  def create
    if current_user.confirm_token == token_params[:token]
      current_user.update_column(:email_confirmed, true)
      flash[:success] = "Thank you! Your account is now activated."
      redirect_to dashboard_path
    end
  end

  private

  def token_params
    params.permit(:token)
  end
end
