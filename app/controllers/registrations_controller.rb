class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
    new_user_profile_path(current_user) #new_profile_path #'/an/example/path' # Or :prefix_to_your_route
  end
end
