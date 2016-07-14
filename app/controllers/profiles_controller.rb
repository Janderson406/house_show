class ProfilesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @profiles = Profile.all.order("created_at DESC")
  end

  def show
    @profile = Profile.find(params[:id])
    @user = User.find(params[:id])

  end

  def new
    @profile = Profile.new
    @profile.user = current_user

  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user = current_user
    if @profile.save
      redirect_to @profile, notice: "Profile was saved successfully."
    else
      flash.now[:alert] = "Error creating profile. Please try again."
    render :new
    end
  end

  def edit
    @profile = Profile.find(params[:id])
  end

  def update
    @profile = Profile.find(params[:id])
    if @profile.update(profile_params)
      flash[:notice] = "Profile listing was updated."
			redirect_to @profile
		else
      flash.now[:alert] = "Unable to update your profile. Please try again."
			render :edit
		end
  end

  private

  def profile_params
    params.require(:profile).permit(:bio, :link, :user_id, :photo)
  end
end
