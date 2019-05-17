class UsersController < ApplicationController
  def show
    render locals: {
      facade: GithubFacade.new(current_user),
      bookmarks: current_user.display_bookmarks
    }
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    @user.confirmation_token
    if @user.save
      session[:user_id] = @user.id
      redirect_to dashboard_path
    else
      flash.now[:error] = 'Username already exists'
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :password)
  end
end
