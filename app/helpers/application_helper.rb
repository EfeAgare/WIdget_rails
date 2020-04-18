module ApplicationHelper

  def current_user
    if session[:token] != nil
      return true
    else
      return false
    end
  end
end
