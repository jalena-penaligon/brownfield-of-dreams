# frozen_string_literal: true

class WelcomeController < ApplicationController
  def index
    @tutorials = if params[:tag]
                   tagged_tutorials
                 else
                   untagged_tutorials
                 end
    @tutorials = @tutorials.where(classroom: false) if current_user.nil?
  end

  private

  def tagged_tutorials
    Tutorial.tagged_with(params[:tag])
            .paginate(page: params[:page], per_page: 5)
  end

  def untagged_tutorials
    Tutorial.all.paginate(page: params[:page], per_page: 5)
  end
end
