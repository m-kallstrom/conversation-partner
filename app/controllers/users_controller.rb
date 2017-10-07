class UsersController < ApplicationController

  def show
    @user = User.find_by(id: params[:id])
  end

  def new
    @user = User.new
    render layout: "auth"
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to '/'
    else
      @errors = @user.errors.full_messages
      render "new", layout: "auth"
    end
  end


  private

    def user_params
      params.require(:user).permit(:username, :email, :password)
    end

end
