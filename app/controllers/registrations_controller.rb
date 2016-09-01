class RegistrationsController < ApplicationController
  def new
    @user_sign_up = UserSignupForm.new
  end

  def create
    @user = User.new(
      first_name: params[:user_signup_form][:first_name],
      last_name:  params[:user_signup_form][:last_name],
      email:      params[:user_signup_form][:email],
      password:   params[:user_signup_form][:password],
      password_confirmation: params[:user_signup_form][:password_confirmation],
      phone:      params[:user_signup_form][:phone],
      avatar:     params[:user_signup_form][:avatar]
    )
    @user.save

    address = Address.new(
      street: params[:user_signup_form][:street],
      city:   params[:user_signup_form][:city],
      state:  params[:user_signup_form][:state],
      zip:    params[:user_signup_form][:zip]
    )
    address.user = @user
    address.save
    sign_in @user
    redirect_to new_profile_path(current_user), notice: "Welcome aboard, #{current_user.first_name}! Set up your public profile now."
  end

  # def after_sign_up_path_for(resource)
  #   new_profile_path(current_user) #new_profile_path #'/an/example/path' # Or :prefix_to_your_route
  # end
end
