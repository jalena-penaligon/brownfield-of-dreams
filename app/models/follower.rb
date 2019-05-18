# frozen_string_literal: true

class Follower
  include RegisteredHelper

  attr_reader :login, :html_url

  def initialize(follower_data)
    @login = follower_data[:login]
    @html_url = follower_data[:html_url]
  end
end
