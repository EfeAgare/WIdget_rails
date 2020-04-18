module RestApiClient
 module Payload
		
    def create_user_payload(params)
        {
					client_id: ENV["client_id"],
					client_secret: ENV["client_secret"],
					user: {
						first_name: params[:last_name],
            last_name: params[:last_name],
            email: params[:email],
            password: params[:password],
						image_url: "https://static.thenounproject.com/png/961-200.png"
					}
        }
    end

    def login_user_payload(params)
        {
          grant_type: "password",
					client_id: ENV["client_id"],
					client_secret: ENV["client_secret"],
          username: params[:email],
          password: params[:password],
        }
    end
 end
end