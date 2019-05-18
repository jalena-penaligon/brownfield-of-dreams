# frozen_string_literal: true

class GithubService
  def initialize(current_user)
    @current_user = current_user
  end

  def retrieve_repos
    retrieve_json('user/repos')
  end

  def retrieve_followers
    retrieve_json('user/followers')
  end

  def retrieve_following
    retrieve_json('user/following')
  end

  def retrieve_email(handle)
    retrieve_json("users/#{handle}")[:email]
  end

  private

  def retrieve_json(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new('https://api.github.com/') do |f|
      f.params[:access_token] = @current_user.access_token
      f.adapter Faraday.default_adapter
    end
  end
end
