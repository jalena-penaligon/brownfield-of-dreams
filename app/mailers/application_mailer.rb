# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'no-reply@turingtutorials.com'
  layout 'mailer'
end
