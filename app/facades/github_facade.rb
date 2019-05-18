# frozen_string_literal: true

class GithubFacade
  def initialize(current_user)
    @current_user = current_user
  end

  def repos(quantity)
    all_repos = repo_data.map do |repo_data|
      Repo.new(repo_data)
    end

    all_repos.sample(quantity)
  end

  def followers
    follower_data.map do |follower_data|
      Follower.new(follower_data)
    end
  end

  def followings
    following_data.map do |following_data|
      Following.new(following_data)
    end
  end

  private

  def repo_data
    @_repo_data ||= service.retrieve_repos
  end

  def follower_data
    @_follower_data ||= service.retrieve_followers
  end

  def following_data
    @_following_data ||= service.retrieve_following
  end

  def service
    @_service ||= GithubService.new(@current_user)
  end
end
