class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]


  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find_by(id: params[:id])
  end

  # GET /users/new
  def new
    @user = User.new
    render layout: "auth"
  end


  # POST /users
  # POST /users.json
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
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find_by(id: params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:username, :email, :password)
    end
end
