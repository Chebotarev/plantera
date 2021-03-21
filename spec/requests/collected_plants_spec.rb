require 'rails_helper'

RSpec.describe "CollectedPlants", type: :request do
  describe "GET /new" do
    it "returns http success" do
      get "/collected_plants/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /index" do
    it "returns http success" do
      get "/collected_plants/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/collected_plants/destroy"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      get "/collected_plants/update"
      expect(response).to have_http_status(:success)
    end
  end

end
