class WidgetController < ApplicationController
  def index
    @widgets = get_all_widget

    if @widgets['code'] == 10
      return @widgets = ''
    else
      return @widgets = @widgets['data']['widgets']
    end
  end

  def new
  end

  def create
    @widget = Validations::Widget.new(widget_payload)

    if !@widget.valid?
      json_response(@widget.errors, :bad_request)
    else
      response = create_widget(widget_payload)
      if response['message'] != 'Success'
        json_response(response)
      else
        redirect_to user_widget_path
      end
    end
  end

  def edit
    @widget = get_widget(params[:id])['data']
  end

  def update
    @widget = Validations::UpdateWidget.new(update_widget_payload)
    if !@widget.valid?
      json_response(@widget.errors, :bad_request)
    else
      response = update_widget(params[:id], update_widget_payload)
      if response['message'] != 'Success'
        json_response(response)
      else
        redirect_to user_widget_path
      end
    end
  end

  def delete
    delete_user_widget(params[:id])
    redirect_to user_widget_path
  end

  def user_widget
    @widgets = get_all_user_widget

    if @widgets['code'] == 10
      return @widgets = ''
    else
      return @widgets = @widgets['data']['widgets']
    end
  end

  end
  
  private

  def widget_payload
    {
      name: params[:name],
      description: params[:description],
      kind: params[:kind] == '1' ? 'hidden' : 'visible'
    }
  end

  def update_widget_payload
    {
      name: params[:name],
      description: params[:description],
    }
  end
end
