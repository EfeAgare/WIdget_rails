require 'rails_helper'

module Helpers
  module HttpsClient

    def response_file(name)
      root = Rails.root.join("spec", "fixtures")
      File.read(root.join("#{name}.json"))
    end

    def get_all_widgets
      stub_request(:get, "https://showoff-rails-react-production.herokuapp.com/api/v1/widgets/visible?client_id=#{ENV["client_id"]}&client_secret=#{ENV["client_secret"]}").
      with(
        headers: {
       'Authorization'=>'Bearer',
       'Content-Type'=>'application/json',
        }).
      to_return(status: 200, body: response_file("all_widget"), headers: { 'content-type': 'application/json'})
    end

    def edit_widget
      stub_request(:get, "https://showoff-rails-react-production.herokuapp.com/api/v1/widgets/2").
      with(
        headers: {
       'Authorization'=>'Bearer 9a1a433fec9ee269526c00216c78bfb92978',
       'Content-Type'=>'application/json',
        }).
      to_return(status: 200, body: response_file("all_widget"), headers: {'content-type': 'application/json'})
    end

    def create_widget
      stub_request(:post, "https://showoff-rails-react-production.herokuapp.com/api/v1/widgets").
         with(
           body: {"widget"=>{"name"=>"A Hidden Widget and this is working for me oh", "description"=>"Yes this is working for me oh and very nice", "kind"=>"visible"}},
           headers: {
          'Accept'=>'*/*',
          'Authorization'=>'Bearer 9a1a433fec9ee269526c00216c78bfb92978',
          'Content-Type'=>'application/x-www-form-urlencoded',
           }).
         to_return(status: 200, body: response_file("create_widget"), headers: {})
    end


    def update_widget
      stub_request(:put, "https://showoff-rails-react-production.herokuapp.com/api/v1/widgets/2482").
         with(
           body: {"widget"=>{"name"=>"A Hidden Widget and this is working for me oh", "description"=>"Yes this is working for me oh and very nice"}},
           headers: {
          'Authorization'=>'Bearer 9a1a433fec9ee269526c00216c78bfb92978',
          'Content-Length'=>'143',
          'Content-Type'=>'application/x-www-form-urlencoded',
           }).
         to_return(status: 200, body: response_file("create_widget"), headers: {})
    end

    def delete_widget
      stub_request(:delete, "https://showoff-rails-react-production.herokuapp.com/api/v1/widgets/1").
         with(
           headers: {
          'Authorization'=>'Bearer 9a1a433fec9ee269526c00216c78bfb92978',
          'Content-Type'=>'application/json',
           }).
         to_return(status: 200, body: response_file("create_widget"), headers: {})
    end


    # Users

    def get_all_user_widget
      stub_request(:get, "https://showoff-rails-react-production.herokuapp.com/api/v1/widgets").
         with(
           headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'Authorization'=>'Bearer 9a1a433fec9ee269526c00216c78bfb92978',
          'Content-Type'=>'application/json',
          'Host'=>'showoff-rails-react-production.herokuapp.com',
          'User-Agent'=>'rest-client/2.1.0 (darwin18.7.0 x86_64) ruby/2.6.2p47'
           }).
         to_return(status: 200, body: response_file("all_widget"), headers: {})

      stub_request(:get, "https://showoff-rails-react-production.herokuapp.com/api/v1/users/me").
         with(
           headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'Authorization'=>'Bearer 9a1a433fec9ee269526c00216c78bfb92978',
          'Content-Type'=>'application/json',
          'Host'=>'showoff-rails-react-production.herokuapp.com',
          'User-Agent'=>'rest-client/2.1.0 (darwin18.7.0 x86_64) ruby/2.6.2p47'
           }).
         to_return(status: 200, body: response_file("all_widget"), headers: {})
    end

    def get_other_user_profile
      stub_request(:get, "https://showoff-rails-react-production.herokuapp.com/api/v1/users/1").
      with(
        headers: {
       'Accept'=>'*/*',
       'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
       'Authorization'=>'Bearer 9a1a433fec9ee269526c00216c78bfb92978',
       'Content-Type'=>'application/json',
       'Host'=>'showoff-rails-react-production.herokuapp.com',
       'User-Agent'=>'rest-client/2.1.0 (darwin18.7.0 x86_64) ruby/2.6.2p47'
        }).
      to_return(status: 200, body: response_file("create_widget"), headers: {})

      stub_request(:get, "https://showoff-rails-react-production.herokuapp.com/api/v1/users/1/widgets?client_id=#{ENV["client_id"]}&client_secret=#{ENV["client_secret"]}").
         with(
           headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'Authorization'=>'Bearer 9a1a433fec9ee269526c00216c78bfb92978',
          'Content-Type'=>'application/json',
          'Host'=>'showoff-rails-react-production.herokuapp.com',
          'User-Agent'=>'rest-client/2.1.0 (darwin18.7.0 x86_64) ruby/2.6.2p47'
           }).
         to_return(status: 200, body: response_file("all_widget"), headers: {})
      
    end


    def change_password
      stub_request(:post, "https://showoff-rails-react-production.herokuapp.com/api/v1/users/me/password").
         with(
           body: {"user"=>{"current_password"=>"eeeeeeee", "new_password"=>"eeeeeeee"}},
           headers: {
          'Authorization'=>'Bearer 9a1a433fec9ee269526c00216c78bfb92978',
          'Content-Length'=>'59',
          'Content-Type'=>'application/x-www-form-urlencoded'
           }).
         to_return(status: 200, body: response_file("change_password"), headers: {})
    end


    def reset_password

      stub_request(:post, "https://showoff-rails-react-production.herokuapp.com/api/v1/users/reset_password").
         with(
           body: {"client_id"=>"#{ENV["client_id"]}", "client_secret"=>"#{ENV["client_secret"]}", "user"=>{"email"=>"eeeeeeee"}},
           headers: {

          'Authorization'=>'Bearer 9a1a433fec9ee269526c00216c78bfb92978',
          'Content-Length'=>'174',
          'Content-Type'=>'application/x-www-form-urlencoded'
           }).
         to_return(status: 200, body: response_file("change_password"), headers: {})
    end


    def register_user
      stub_request(:post, "https://showoff-rails-react-production.herokuapp.com/api/v1/users").
      with(
        body: {"client_id"=>"#{ENV["client_id"]}", "client_secret"=>"#{ENV["client_secret"]}", "user"=>{"first_name"=>"User", "last_name"=>"User", "email"=>"victor@gmail.com", "password"=>"password", "image_url"=>"https://static.thenounproject.com/png/961-200.png"}},
        headers: {
       'Accept'=>'*/*',
       'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
       'Content-Length'=>'327',
       'Content-Type'=>'application/x-www-form-urlencoded',
       'Host'=>'showoff-rails-react-production.herokuapp.com',
       'User-Agent'=>'rest-client/2.1.0 (darwin18.7.0 x86_64) ruby/2.6.2p47'
        }).
      to_return(status: 200, body: response_file("change_password"), headers: {})
      
    end


    def login_user
      stub_request(:post, "https://showoff-rails-react-production.herokuapp.com/oauth/token").
      with(
        body: {"client_id"=>"#{ENV["client_id"]}", "client_secret"=>"#{ENV["client_secret"]}", "grant_type"=>"password", "password"=>"password", "username"=>"victor@gmail.com"},
        headers: {
       'Accept'=>'*/*',
       'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
       'Content-Length'=>'219',
       'Content-Type'=>'application/x-www-form-urlencoded',
       'Host'=>'showoff-rails-react-production.herokuapp.com',
       'User-Agent'=>'rest-client/2.1.0 (darwin18.7.0 x86_64) ruby/2.6.2p47'
        }).
      to_return(status: 200, body: response_file("change_password"), headers: {})
      
      stub_request(:get, "https://showoff-rails-react-production.herokuapp.com/api/v1/users/me").
      with(
        headers: {
       'Accept'=>'*/*',
       'Authorization'=>'Bearer cf3c3cc6ffcda5e3c284aaad0f77',
       'Content-Type'=>'application/json',
       'Host'=>'showoff-rails-react-production.herokuapp.com',
       'User-Agent'=>'rest-client/2.1.0 (darwin18.7.0 x86_64) ruby/2.6.2p47'
        }).
      to_return(status: 200, body: response_file("all_widget"), headers: {})
    end


    def logout
      stub_request(:post, "https://showoff-rails-react-production.herokuapp.com/oauth/revoke").
      with(
        body: {"token"=>"ert567467890yui"},
        headers: {
       'Authorization'=>'Bearer ert567467890yui',
       'Content-Length'=>'21',
       'Content-Type'=>'application/x-www-form-urlencoded'
        }).
      to_return(status: 200, body: response_file("all_widget"), headers: {})
    end

    def widget_search
      
      stub_request(:get, "https://showoff-rails-react-production.herokuapp.com/api/v1/widgets/visible?client_id=#{ENV["client_id"]}&client_secret=#{ENV["client_secret"]}&term=").
      with(
        headers: {
       'Authorization'=>'Bearer 9a1a433fec9ee269526c00216c78bfb92978',
       'Content-Type'=>'application/json',
        }).
      to_return(status: 200, body: response_file("all_widget"), headers: {})
    end

    def me_widget_search
      stub_request(:get, "https://showoff-rails-react-production.herokuapp.com/api/v1/users/me/widgets?client_id=#{ENV["client_id"]}&client_secret=#{ENV["client_secret"]}").
      with(
        headers: {
       'Authorization'=>'Bearer 9a1a433fec9ee269526c00216c78bfb92978',
       'Content-Type'=>'application/json',
        }).
      to_return(status: 200, body: response_file("all_widget"), headers: {})
    end

    def me_with_term_widget_search
      stub_request(:get, "https://showoff-rails-react-production.herokuapp.com/api/v1/users/me/widgets?client_id=#{ENV["client_id"]}&client_secret=#{ENV["client_secret"]}&term=ok").
      with(
        headers: {
       'Authorization'=>'Bearer 9a1a433fec9ee269526c00216c78bfb92978',
       'Content-Type'=>'application/json',
        }).
      to_return(status: 200, body: response_file("all_widget"), headers: {})
    end
  end
end