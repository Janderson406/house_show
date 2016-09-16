class ProfilesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @profiles = Profile.all.order("created_at DESC")
    @user = User.all
  end

  def show
    @profile = Profile.find(params[:id])
    @user = @profile.user
    @photos = @profile.photos
  end

  def new
    @profile = Profile.new
    @profile.user = current_user
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user = current_user
    if @profile.save
      redirect_to users_my_profile_path, notice: "Profile was saved successfully."
    else
      flash.now[:alert] = "Error creating profile. Please try again."
    render :new
    end
  end

  def edit
    @profile = Profile.find(params[:id])
    @photos = @profile.photos

  end

  def update
    @profile = Profile.find(params[:id])
    @photos = @profile.photos
    if @profile.update(profile_params)
      flash[:notice] = "Profile listing was updated."
			redirect_to users_my_profile_path
		else
      flash.now[:alert] = "Unable to update your profile. Please try again."
			render :edit
		end
  end

  private

  def profile_params
    params.require(:profile).permit(:bio, :link, :user_id, photos_attributes: [:description, :image])
  end
end
