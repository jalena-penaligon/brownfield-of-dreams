# frozen_string_literal: true

module RegisteredHelper
  def registered?
    User.find_by(github_login: login).present?
  end
end
