class WidgetController < ApplicationController
  def index
    
    @widgets = get_all_widget

    if @widgets['code'] == 10
      return @widgets = ''
    else
      return @widgets = @widgets['data']['widgets'].first(8)
    end
  end

  def new
    
  end
end
