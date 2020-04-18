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

  def create
    @widget = Validations::Widget.new(widget_payload)

    if !@widget.valid?
      json_response(@widget.errors, :bad_request)
    else
      response = create_widget(widget_payload)
      if response['message'] != 'Success'
        json_response(response)
      else
        redirect_to root_path
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
end
