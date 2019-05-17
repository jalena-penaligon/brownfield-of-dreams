class Admin::TutorialsController < Admin::BaseController
  def edit
    @tutorial = Tutorial.find(params[:id])
  end

  def create
    alter_tutorial_params = tutorial_params
    alter_tutorial_params[:thumbnail] = YouTube::Video.by_id(tutorial_params[:thumbnail]).thumbnail
    tutorial = Tutorial.create(alter_tutorial_params)
    flash[:success] = 'Successfully created tutorial.'
    redirect_to tutorial_path(tutorial)
  end

  def new
    @tutorial = Tutorial.new
  end

  def update
    tutorial = Tutorial.find(params[:id])
    if tutorial.update(tutorial_tag_params)
      flash[:success] = "#{tutorial.title} tagged!"
    end
    redirect_to edit_admin_tutorial_path(tutorial)
  end

  def destroy
    tutorial = Tutorial.find(params[:id])
    if tutorial.destroy
      flash[:success] = "#{tutorial.title} has been deleted."
    end
    redirect_to admin_dashboard_path
  end

  private
  def tutorial_tag_params
    params.require(:tutorial).permit(:tag_list)
  end

  def tutorial_params
    params.require(:tutorial).permit(:title, :description, :thumbnail)
  end
end
