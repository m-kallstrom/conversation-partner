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
    # If the user exists AND the password entered is correct.
    if user && user.authenticate(session_params[:password])
      # Save the user id inside the browser cookie. This is how we keep the user
      # logged in when they navigate around our website.
      session[:user_id] = user.id
      redirect_to '/'
    else
      @errors = ['Either your username or password was incorrect.']
      # If user's login doesn't work, send them back to the login form.
      render "new", layout: "auth"
    end
  end

  private
  def session_params
    params.require(:session).permit(:email, :password)
  end
end
