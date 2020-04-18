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
        authorise_user(response)
        redirect_to root_path
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
          authorise_user(response)
          redirect_to root_path
        end
      end
  end

  def logout_user
    revoke_token
    session[:token] = nil
    session[:refresh_token] = nil
    redirect_to root_path
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
        username: params[:email],
        password: params[:password]
    }
  end

  u
end
