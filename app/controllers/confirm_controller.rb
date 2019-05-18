# frozen_string_literal: true

class ConfirmController < ApplicationController
  def create
    if current_user.confirm_token == token_params[:token]
      current_user.update_column(:email_confirmed, true)
      flash[:success] = 'Thank you! Your account is now activated.'
      redirect_to dashboard_path
    else
      flash[:error] = 'Error! That token is not valid.'
      redirect_to root_path
    end
  end

  private

  def token_params
    params.permit(:token)
  end
end
