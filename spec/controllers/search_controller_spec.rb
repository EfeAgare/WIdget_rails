require 'rails_helper'

describe SearchController do
  before do
    session[:token] = '9a1a433fec9ee269526c00216c78bfb92978'
    allow_any_instance_of(ApplicationController).to receive(:authorise).and_return(session[:token])
    widget_search
   end

  describe '#Widget_search' do
    before do
      widget_search
    end
    
    
    it "returns all widgets" do
      get :widget_search, params: {
          y: "All"
      }
      expect(response).to be_successful
    end
  end

  describe '#Widget_search ME' do
    
    before do
      me_widget_search
    end
    it "returns all widgets" do
      get :widget_search, params: {
          y: "Me"
      }
      expect(response).to be_successful
    end
  end

  describe '#Widget_search ME and a search term' do
    
    before do
      me_with_term_widget_search
    end
    it "returns all widgets" do
      get :widget_search, params: {
          y: "Me",
          term: "ok"
      }
      expect(response).to be_successful
    end
  end
end

