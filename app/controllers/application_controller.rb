class ApplicationController < ActionController::Base
  include RestApiClient::HttpRequest
  include RestApiClient::Payload
  include Response

  protect_from_forgery with: :exception 
  before_action :current_user

  private   

  def authorise_user(response)
    session[:token] = response['data']['token']['access_token']
    session[:refresh_token] = response['data']['token']['refresh_token']
  end

  def current_user
    if session[:token] != nil
      return true
    else
      return false
    end
  end
end
