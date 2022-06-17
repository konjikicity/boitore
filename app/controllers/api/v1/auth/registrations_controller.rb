class Api::V1::Auth::RegistrationsController < DeviseTokenAuth::RegistrationsController
  protect_from_forgery
  
  private

  def sign_up_params
    params.permit(:name, :email, :password, :password_confirmation)
  end
end
