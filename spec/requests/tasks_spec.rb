require 'rails_helper'

RSpec.describe "Tasks", type: :request do
  describe "GET /index" do
    it "returns status 401 with regular request" do
      get '/tasks/1'
      expect(response.status).to equal(401)
    end  
    it "returns sttaus 200 with regular request" do
      get '/tasks/today'
      expect(response.status).to equal(401)
    end 
    it "returns sttaus 200 create task" do
      get '/tasks/today'
      expect(response.status).to equal(401)
    end  
  end
end
