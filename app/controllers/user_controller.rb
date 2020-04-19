class UserController < ApplicationController
  def index
    @user = get_current_user_profile['data']['user']
  end

  def other_users_profile
    @user = get_other_users_profile(params[:id])
    if @user['data'].present?
      @user = @user['data']['user']
    else
      render_404
    end
  end


  def user_widget_search
    if params[:term].present?

    else
     @widgets = user_id_with_params_widget_search
    end
    render partial: 'user/user_widget_search_result', locals: { widgets: @widgets }
  end

  def user_id_with_params_widget_search
   widget_user_id_search(params[:Id])['data']['widgets']
  end
end
