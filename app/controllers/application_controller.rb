class ApplicationController < ActionController::Base
  include RestApiClient::HttpRequest
  include RestApiClient::Payload
  include Response
end
