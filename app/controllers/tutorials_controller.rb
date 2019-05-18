# frozen_string_literal: true

class TutorialsController < ApplicationController
  def show
    tutorial = Tutorial.find(params[:id])
    render locals: { facade: TutorialFacade.new(tutorial, params[:video_id]) }
  end
end
