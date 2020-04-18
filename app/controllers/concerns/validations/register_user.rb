module Validations
  class RegisterUser
    include ActiveModel::Validations

    attr_accessor :first_name, :last_name, :email, :password
 
    EMAIL_REGREX = /(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))/
    
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, presence: true, format: {with: EMAIL_REGREX }
    validates :password, presence: true, length: { minimum: 8 }

    def initialize(params={})
      @first_name = params[:first_name]
      @last_name = params[:last_name]
      @email = params[:email]
      @password = params[:password]
      ActionController::Parameters.new(params).permit(:first_name, :last_name, :email, :password)
    end
  end
end