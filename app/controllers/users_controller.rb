class UsersController < ApplicationController
  #before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    #@events = @user.events
  end

  def profile
    @user = current_user
  end

end
