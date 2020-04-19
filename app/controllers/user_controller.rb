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
end
