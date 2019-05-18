# frozen_string_literal: true

class Admin::VideosController < Admin::BaseController
  def edit
    @video = Video.find(params[:id])
  end

  def update
    video = Video.find(params[:id])
    video.update!(video_params)
    redirect_to tutorial_path(video.tutorial)
  end

  def create
    begin
      tutorial = Tutorial.find(params[:tutorial_id])
      create_video(new_video_params, tutorial)
    rescue StandardError
      flash[:error] = 'Unable to create video.'
    end
    redirect_to edit_admin_tutorial_path(id: tutorial.id)
  end

  private

  def new_video_params
    params.require(:video).permit(:title, :description, :video_id, :position)
  end

  def video_params
    params.require(:video).permit(:title, :description, :video_id, :thumbnail)
  end

  def create_video(params, tutorial)
    thumbnail = YouTube::Video.by_id(params[:video_id]).thumbnail
    video = tutorial.videos.new(params.merge(thumbnail: thumbnail))
    video.save!
    flash[:success] = 'Successfully created video.'
  end
end
