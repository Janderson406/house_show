class UsersController < ApplicationController
  #before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    #@events = @user.events
  end

  def my_profile
    @user = current_user
    @profile = current_user.profile
    @address = current_user.address
    @photo = @profile.photos



  end

end
