class AuthenticationController < ApplicationController

  def register_user
    @user = Validations::RegisterUser.new(user_params)
 
    if !@user.valid?
      json_response(@user.errors, :bad_request)
    else
      response = create_user(user_params)
      if response['message'] != 'Success'
        json_response(response)
      else

      end
    end
  end

  def login_user
      @user = Validations::LoginUser.new(login_user_params)
  
      if !@user.valid?
        json_response(@user.errors, :bad_request)
      else
        response = authenticate_user(user_params)
        if response['message'] != 'Success'
          json_response(response)
        else

        end
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
  def login_user_params 
    {
        email: params[:email],
        password: params[:password]
    }
  end
end
