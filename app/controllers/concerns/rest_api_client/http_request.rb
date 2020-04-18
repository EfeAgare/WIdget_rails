module RestApiClient
  module HttpRequest
    
    BASE_URL = 'https://showoff-rails-react-production.herokuapp.com'
    
    def create_user(payload)
      resData = RestClient::Request.execute(method: :post, url: "#{BASE_URL}/api/v1/users", payload: create_user_payload(payload),
       headers: {'content-type': 'application/json'})  {|response, request, result| response }
      JSON.parse(resData)
    end

    def get_all_widget
      resData = RestClient::Request.execute(method: :get, url: "#{BASE_URL}/api/v1/widgets",
      headers: {'content-type': 'application/json', Authorization:  "Bearer #{session[:token]}"} )  {|response, request, result| response }

     JSON.parse(resData)
    end

    def authenticate_user(payload)
      resData = RestClient::Request.execute(method: :post, url: "#{BASE_URL}/oauth/token", payload: login_user_payload(payload),
      headers: {'content-type': 'application/json'})  {|response, request, result| response }

     JSON.parse(resData)
    end

    def revoke_token
      resData = RestClient::Request.execute(method: :post, url: "#{BASE_URL}/oauth/revoke",payload: {
        token: session[:token]
      },
      headers: {'content-type': 'application/json', Authorization: "Bearer #{session[:token]}"} )  {|response, request, result| response }

     JSON.parse(resData)
    end

    def create_widget(payload)
      resData = RestClient::Request.execute(method: :post, url: "#{BASE_URL}/api/v1/widgets",payload:{ 'widget': payload},
      headers: {'content-type': 'application/json', Authorization: "Bearer #{session[:token]}"} )  {|response, request, result| response }

     JSON.parse(resData)
    end
  end
end