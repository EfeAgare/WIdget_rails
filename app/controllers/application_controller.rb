class ApplicationController < ActionController::Base
  add_flash_types :info, :error, :warning
  include RestApiClient::HttpRequest
  include RestApiClient::Payload
  include Response

  protect_from_forgery with: :exception 
  before_action :authorise

  private   

  def authorise_user(response)
    if response['data'].present?
      if response['data']['token']
        session[:token] = response['data']['token']['access_token']
        session[:refresh_token] = response['data']['token']['refresh_token']
      elsif response['data']['user']
        session[:user_id] = response['data']['user']['id']
      end
    else
      flash[:notice] = 'There was an error logging in. Please try again.'
      redirect_to root_path && return
    end
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

  def authorise
    if session[:token] == nil
      redirect_to root_path
      flash[:notice] = 'You need to login or signup to access the page'
    end
  end
end
