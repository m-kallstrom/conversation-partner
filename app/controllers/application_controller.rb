class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def current_conversation
    @current_conversation ||=Conversation.find(session[:conversation_id]) if session[:conversation_id]
  end

  helper_method :current_conversation

  def authorize
    redirect_to '/login' unless current_user
  end
end

