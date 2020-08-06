require 'rails_helper'

RSpec.describe "Sessions", type: :request do

  describe "GET /login" do
    it "Log in is working properly" do
      get login_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "Signup is working properly" do
      get new_user_path
      expect(response).to have_http_status(:success)
    end
  end

end
