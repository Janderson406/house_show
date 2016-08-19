class RegistrationsController < ApplicationController
  def new
    @user_sign_up = UserSignupForm.new
  end

  def create
    @user = User.new(
      first_name: params[:user_sign_up_form][:first_name],
      last_name:  params[:user_sign_up_form][:last_name],
      email:      params[:user_sign_up_form][:email],
      password:   params[:user_sign_up_form][:password],
      password_confirmation: params[:user_sign_up_form][:password_confirmation],
      avatar:     params[:user_sign_up_form][:avatar]
    )
    @user.save

    address = Address.new(
      street: params[:user_sign_up_form][:street],
      city:   params[:user_sign_up_form][:city],
      state:  params[:user_sign_up_form][:state],
      zip:    params[:user_sign_up_form][:zip]
    )
    address.user = @user
    address.save
    redirect_to root_path, notice: "Welcome aboard!"
  end

  # def after_sign_up_path_for(resource)
  #   new_profile_path(current_user) #new_profile_path #'/an/example/path' # Or :prefix_to_your_route
  # end
end
