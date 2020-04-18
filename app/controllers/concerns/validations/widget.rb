module Validations
  class Widget
    include ActiveModel::Validations

    attr_accessor :name, :description, :kind
    
    validates :name, presence: true, length: { minimum: 8 }
    validates :description, presence: true, length: { minimum: 20 }
    validates :kind, presence: true

    def initialize(params={})
      @name = params[:name]
      @description = params[:description]
      @kind = params[:kind]
      ActionController::Parameters.new(params).permit(:name, :description, :kind)
    end
  end
end