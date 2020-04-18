class ApplicationController < ActionController::Base
  include RestApiClient::HttpRequest
  include RestApiClient::Payload
  include Response

  before_action :authorize_request

  private   
  def current_user   
    @current_user = session[:token]
    if @current_user
      
    else
      redirect_to root_path
    end
  end 
 
end
