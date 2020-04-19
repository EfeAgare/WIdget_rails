class SearchController < ApplicationController

  def widget_search
    if params[:y] == 'All' 
      @widgets = general_search
    elsif params[:y] == 'Me'
      @widgets = me_widget_search
    end
  end

  def general_search
    search(params[:term])['data']['widgets']
  end

  def me_widget_search
    widget_me_search['data']['widgets']
  end  
end
