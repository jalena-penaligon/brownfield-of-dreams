# frozen_string_literal: true

class Repo
  attr_reader :name, :html_url

  def initialize(repo_data)
    @name = repo_data[:name]
    @html_url = repo_data[:html_url]
  end
end
