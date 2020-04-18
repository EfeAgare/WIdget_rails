module Validations
  class LoginUser
    include ActiveModel::Validations

    attr_accessor :username, :password
 
    EMAIL_REGREX = /(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))/
    
    validates :username, presence: true, format: {with: EMAIL_REGREX }
    validates :password, presence: true, length: { minimum: 8 }

    def initialize(params={})
      @username = params[:username]
      @password = params[:password]
      ActionController::Parameters.new(params).permit(:username, :password)
    end
  end
end