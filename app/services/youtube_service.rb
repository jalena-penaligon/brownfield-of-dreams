# frozen_string_literal: true

class YoutubeService
  def video_info(id)
    id = id.slice(-11, 11)
    params = { part: 'snippet,contentDetails,statistics', id: id }
    retrieve_json('youtube/v3/videos', params)
  end

  private

  def retrieve_json(url, params)
    response = conn.get(url, params)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: 'https://www.googleapis.com') do |f|
      f.adapter Faraday.default_adapter
      f.params[:key] = ENV['YOUTUBE_API_KEY']
    end
  end
end
