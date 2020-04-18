class ApplicationController < ActionController::Base
  include RestApiClient::HttpRequest
  include RestApiClient::Payload
  include Response

  before_action :current_user

  private   

  def authorise_user(response)
    session[:token] = response['data']['token']['access_token']
    session[:refresh_token] = response['data']['token']['refresh_token']
  end

  def current_user
    return true unless session[:token] == nil
  end
end
