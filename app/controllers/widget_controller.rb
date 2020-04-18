class WidgetController < ApplicationController
  def index
    @widgets = get_all_widget['data']['widgets'].first(8)
    # binding.pry
  end
end
