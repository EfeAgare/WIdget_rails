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
      headers: {'content-type': 'application/json', :Authorization => "Bearer #{'485c096b4a04f02ab532e3b8e846fa945fbc270b483344eeda553e3efe5c878e'}"} )  {|response, request, result| response }

     JSON.parse(resData)
    end

    def authenticate_user(payload)
      resData = RestClient::Request.execute(method: :post, url: "#{BASE_URL}/oauth/token", payload: login_user_payload(payload),
      headers: {'content-type': 'application/json'})  {|response, request, result| response }

     JSON.parse(resData)
    end
  end
end

# 485c096b4a04f02ab532e3b8e846fa945fbc270b483344eeda553e3efe5c878e