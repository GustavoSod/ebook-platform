require 'rails_helper'

RSpec.describe "HomeController", type: :request do
  describe "GET /index" do
    it "unauthenticated root_path" do
      get unauthenticated_root_path
      expect(response).to have_http_status(200)
      expect(response).to render_template(:index)
    end
    it "authenticated root_path" do
      get authenticated_root_path
      expect(response).to have_http_status(200)
      expect(response).to render_template(:index)
    end
  end
end
