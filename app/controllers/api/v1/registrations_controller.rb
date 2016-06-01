class Api::V1::RegistrationsController < DeviseTokenAuth::RegistrationsController
  def sign_up_params
    params.permit(:email, :password, :password_confirmation, :devise_color, :devise_model)
  end
end
