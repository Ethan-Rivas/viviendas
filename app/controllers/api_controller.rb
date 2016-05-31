class ApiController < ActionController::Base
  include DeviseTokenAut::Concerns::SetUserByToken
end
