# frozen_string_literal: true

class Following
  include RegisteredHelper

  attr_reader :login, :html_url

  def initialize(following_data)
    @login = following_data[:login]
    @html_url = following_data[:html_url]
  end
end
