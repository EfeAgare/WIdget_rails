
module Helpers
  module Authentication
    def login_user
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(true)
    end

    def logout
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(false)
    end
  end
end