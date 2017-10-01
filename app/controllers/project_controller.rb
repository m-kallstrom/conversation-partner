class ProjectController < ApplicationController

  def landing
    if current_user
      redirect_to "/conversations/main"
    end
    render layout: "auth"
  end

  def about

  end

end
