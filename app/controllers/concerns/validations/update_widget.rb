module Validations
  class UpdateWidget
    include ActiveModel::Validations

    attr_accessor :name, :description
    
    validates :name, presence: true, length: { minimum: 8 }
    validates :description, presence: true, length: { minimum: 20 }

    def initialize(params={})
      @name = params[:name]
      @description = params[:description]
      ActionController::Parameters.new(params).permit(:name, :description)
    end
  end
end