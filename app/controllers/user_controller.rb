class UserController < ApplicationController

  def index
    @user = get_current_user_profile['data']['user']
    @widgets = get_all_user_widget['data']['widgets']
  end

  def other_users_profile
    @user = get_other_users_profile(params[:id])

    if @user['data'].present?
      @user = @user['data']['user']
      if params[:term].present?
        @widgets = user_id_and_term_params_widget_search
      else
        @widgets = user_id_params_widget_search
      end
    else
      render_404
    end
  end


  def user_widget_search
    other_users_profile
    render template: 'user/index'
  end

  def user_id_params_widget_search
    widget_user_id_search(params[:id])['data']['widgets']
  end

  def user_id_and_term_params_widget_search
    widget_user_id_and_term_search(params[:id], params[:term])['data']['widgets']
  end


end
