class ProjectController < ApplicationController

  def landing
    if current_user
      redirect_to "/conversations/main"
    else
      render layout: "auth"
    end
  end

  def about
      render layout: "auth"
  end

end
