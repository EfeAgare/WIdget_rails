module ApplicationHelper

  def current_user
    if session[:token] != nil
      return true
    else
      return false
    end
  end

  def check_params
    user_profile_path == request.path_info
  end
end
