# frozen_string_literal: true

class TutorialFacade < SimpleDelegator
  def initialize(tutorial, video_id = nil)
    super(tutorial)
    @video_id = video_id
  end

  def current_video
    if @video_id
      videos.find(@video_id)
    else
      videos.first
    end
  end

  def next_video
    videos[current_video_index + 1] || current_video
  end

  def play_next_video?
    (maximum_video_position > current_video.position)
  end

  private

  def current_video_index
    videos.index(current_video)
  end

  def maximum_video_position
    videos.max_by(&:position).position
  end
end
