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


  def change_password
    if password_equal? 
      if !is_password_valid?
        json_response({message: 'Password must be of minimum lenght of 8'}, :bad_request)
      else
        response = change_user_password(change_password_params)
        authorise_user(response)
        json_response({message: 'Password changed successufully'})

      end
    else
      json_response({message: 'Password are not equal'}, :bad_request)
    end
  end

 

  def reset_password
    binding.pry
  end

 private
  

  def password_equal?
    params[:current_password] == params[:new_password]
  end

  def is_password_valid?
    params[:new_password].strip.length == 8
  end

  def change_password_params
    {
      user: {
        current_password: params[:current_password],
        new_password: params[:new_password]
    }
    }
  end
end
