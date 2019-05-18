# frozen_string_literal: true

class ConfirmMailer < ApplicationMailer
  def registration_confirmation(current_user)
    @user = current_user
    mail(to: @user.email, subject: 'Confirm Your Turing Tutorials Account!')
  end
end
