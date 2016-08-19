class UserSignupForm
  include ActiveModel::Model

  attr_accessor :email, :first_name, :last_name, :phone, :street, :city,
                :state, :zip, :avatar, :password, :password_confirmation
end
