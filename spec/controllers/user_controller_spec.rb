require 'rails_helper'

describe UserController do

  before do
    session[:token] = '9a1a433fec9ee269526c00216c78bfb92978'
    allow_any_instance_of(ApplicationController).to receive(:authorise).and_return(session[:token])
    get_all_user_widget
  end

  describe '#Index' do
    it "returns all widgets for this particular user" do
      get :index
      expect(response).to be_successful
    end
  end

  describe "#Other_users_profile" do
    before(:all) do
      get_other_user_profile
    end
    
      it "returns all widgets for this particular user" do
        get :other_users_profile, params: {id: 1}
        expect(response).to be_successful
      end
  end

  describe "#ChangePassword" do
    before do
      change_password
    end
    

    it "successfully change the password" do
      post :change_password, params: {current_password: "eeeeeeee", new_password: "eeeeeeee"}
      expect(response).to be_successful

      expect(JSON.parse(response.body)['message']).to eq 'Password changed successufully'
    end
  end
  
  describe "#reset_password" do
    before do
      reset_password
    end
  
    it "successfully send email to the user" do
      post :reset_password, params: {email: "eeeeeeee"}
      expect(response).to be_successful

      expect(JSON.parse(response.body)['message']).to eq 'Success'
    end
  end
end

