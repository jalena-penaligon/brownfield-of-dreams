# frozen_string_literal: true

class SessionsController < ApplicationController
  def new; end

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user&.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to dashboard_path
    else
      invalid_credentials
    end
  end

  def update
    user = current_user
    user_info = request.env['omniauth.auth']
    user.update_column(:access_token, user_info[:credentials][:token])
    user.update_column(:github_login, user_info[:extra][:raw_info][:login])
    redirect_to dashboard_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  private

  def invalid_credentials
    flash.now[:error] = 'Looks like your email or password is invalid'
    render :new
  end
end
