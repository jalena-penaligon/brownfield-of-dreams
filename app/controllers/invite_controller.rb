# frozen_string_literal: true

class InviteController < ApplicationController
  def new; end

  def create
    email = service.retrieve_email(params[:handle])
    if !email.nil?
      send_invite(email)
      redirect_to dashboard_path
    else
      invalid_handle
    end
  end

  private

  def service
    GithubService.new(current_user)
  end

  def invalid_handle
    flash.now[:error] = 'The github user you selected does not have a valid
    email address associated with their account.'
    render :new
  end

  def send_invite(email)
    FriendInviteMailer.invite(current_user, params[:handle], email)
                      .deliver_now
    service.retrieve_email(params[:handle])
    flash[:success] = 'Successfully sent invite!'
  end
end
