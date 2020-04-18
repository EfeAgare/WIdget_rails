class AuthenticationController < ApplicationController
  include RestApiClient::HttpRequest
  include Payload

  def index
  end

  def register_user
    @user = Validations::RegisterUser.new(user_params)
 
    if !@user.valid?
      json_response(@user.errors, :bad_request)
    else
      response = create_user(user_params)
      binding.pry
      json_response(response)
    end
  end

  private

  def user_params 
    {
        first_name: params[:last_name],
        last_name: params[:last_name],
        email: params[:email],
        password: params[:password]
    }
  end
end
