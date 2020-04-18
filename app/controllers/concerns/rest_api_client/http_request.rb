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
      headers: {'content-type': 'application/json', :Authorization => "Bearer #{'672f9f8f8333210497bfc07c7293654d5de836e678229275561ebda978d3b8ab'}" })  {|response, request, result| response }

     JSON.parse(resData)
    end
  end
end