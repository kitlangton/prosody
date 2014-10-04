require 'rails_helper'

RSpec.describe UsersController, :type => :controller do

  describe "GET desk" do
    it "returns http success" do
      get :desk
      expect(response).to have_http_status(:success)
    end
  end

end
