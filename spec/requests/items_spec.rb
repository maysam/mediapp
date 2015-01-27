require 'rails_helper'

RSpec.describe "Items", :type => :request do
  describe "GET /items" do
    it "works! (now write some real specs)" do
      get items_path
      expect(response).to redirect_to new_user_session_path
      expect(response.status).to be(302)
    end
  end
end
