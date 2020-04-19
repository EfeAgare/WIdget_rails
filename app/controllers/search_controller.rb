class SearchController < ApplicationController

  def widget_search
    @widgets = general_search
  end

  def general_search
    search(params[:term])['data']['widgets']
  end  
end
