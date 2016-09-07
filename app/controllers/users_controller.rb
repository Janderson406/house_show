class UsersController < ApplicationController
  #before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def artists
    @users = User.artist.all
  end

  def hosts
    @users = User.host.all
  end


  def my_profile
    @user = current_user
    if @user.profile.nil?
      redirect_to new_profile_path(@user)
    else
      @user = current_user
      @profile = current_user.profile
      @address = current_user.address
      @photos = @profile.photos
    end
  end

end
