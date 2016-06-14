class Api::V1::RegistrationsController < DeviseTokenAuth::RegistrationsController
  def sign_up_params
    params.permit(:name, :email, :password, :password_confirmation, :phone_number)
  end
end
