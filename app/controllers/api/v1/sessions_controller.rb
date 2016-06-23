class Api::V1::SessionsController < DeviseTokenAuth::SessionsController
  def resource_params
    data = params.permit(*params_for_resource(:sign_in))
    data[:email] += '@codigo.jade'

    return data
  end
end
