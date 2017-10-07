class SessionsController < ApplicationController

  def new
    @user = User.new
    render layout: "auth"
  end

  def destroy
    session[:user_id] = nil
    session[:conversation_id] = nil
    redirect_to '/'
  end

  def create
    user = User.find_by_email(session_params[:email])
    if user && user.authenticate(session_params[:password])
      session[:user_id] = user.id
      redirect_to '/'
    else
      @errors = ['Either your username or password was incorrect.']
      render "new", layout: "auth"
    end
  end

  private
  def session_params
    params.require(:session).permit(:email, :password)
  end
end
