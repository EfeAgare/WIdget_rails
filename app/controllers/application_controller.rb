class ApplicationController < ActionController::Base
  add_flash_types :info, :error, :warning
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

  def render_404
    render template: 'errors/error', status: :not_found
  end
end
