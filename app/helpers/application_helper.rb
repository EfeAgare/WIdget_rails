module ApplicationHelper

  def current_user
    return true unless session[:token] == nil
  end
end
