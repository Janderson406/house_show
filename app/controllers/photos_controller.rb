class PhotosController < ApplicationController
  def index
    @profile = Profile.find(params[:profile_id])
    @photos = @profile.photos
  end

  def show
    @photo = Photo.find(params[:id])
    @profile = Profile.find(params[:profile_id])
  end

  def new
    @profile = Profile.find(params[:profile_id])
    @photo = Photo.new#(photos_params)
  end

  def create
    @photo = Photo.new(photos_params)
    @profile = Profile.find(params[:profile_id])
    @photo.profile = @profile

    if @photo.save
      flash[:notice] = "Photo was saved."
      redirect_to users_my_profile_path
    else
      flash.now[:alert] = "There was an error uploading your photo. Please try again."
      render :new
    end
  end

  def edit
    @photo = Photo.find(params[:id])
  end

  def update
    @photo = Photo.find(params[:id])
    @photo.update(photos_params)
    if @photo.save
      flash[:notice] = "Photo was updated."
      redirect_to users_my_profile_path
    else
      flash.now[:alert] = "There was an error saving the photo."
      render :edit
    end
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    flash[:notice] = "Photo was deleted successfully."
    redirect_to @photo.profile
  end

  private

  def photos_params
    params.require(:photo).permit(:image, :description, :profile_id)
  end
end
