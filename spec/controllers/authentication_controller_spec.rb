require 'rails_helper'

describe AuthenticationController do

  describe '#register_user' do
    before do
      register_user
    end
    
    it "returns all widgets for this particular user" do
      post :register_user, params: {
       
          first_name: "A",
          last_name: "User",
          password: "password",
          email: "victor@gmail.com"
        
      }
      expect(response).to redirect_to(user_widget_path)
    end
  end


  describe '#login_user' do
    before do
      login_user
    end
    
    it "returns all widgets for this particular user" do
      post :login_user, params: {
       
          password: "password",
          email: "victor@gmail.com"
        
      }
      expect(response).to redirect_to(user_widget_path)
    end
  end


  describe '#revoke_user' do
    before do
      session[:token] = 'ert567467890yui'
      logout
    end
    
    
    it "returns all widgets for this particular user" do
      post :logout_user, params: {token: session[:token]}
      expect(response).to redirect_to(root_path)
    end
  end
end

