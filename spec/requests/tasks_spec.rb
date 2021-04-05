require 'rails_helper'

RSpec.describe 'Tasks', type: :request do
  let(:valid_attributes) do
    {
      name: 'Image',
      expiration_day: Date.today + 1,
      time: 1,
      goal: 3,
      img: 'http://res.cloudinary.com/ddcakt97r/image/upload/v1599940689/event_center/meta-studio-35-PJXAjKduyjQ-unsplash_onzzzc.jpg'
    }
  end

  describe 'GET /index' do
    it 'returns status 200 when request a tasks of today' do
      user = create(:user)
      access_token = jwt_and_refresh_token(user, 'user')[0]
      get '/tasks/today', headers: { 'Authorization': "Bearer #{access_token}" }
      expect(response.status).to equal(200)
    end

    it 'returns status 200 when request a tasks of yesterday' do
      user = create(:user)
      access_token = jwt_and_refresh_token(user, 'user')[0]
      get '/tasks/yesterday', headers: { 'Authorization': "Bearer #{access_token}" }
      expect(response.status).to equal(200)
    end

    it 'returns status 200 when request for a certain day' do
      user = create(:user)
      access_token = jwt_and_refresh_token(user, 'user')[0]
      get '/tasks/22-03-2013', headers: { 'Authorization': "Bearer #{access_token}" }
      expect(response.status).to equal(200)
    end

    it 'returns status 401 when request for a certain day with wrong token' do
      get '/tasks/22-03-2013', headers: { 'Authorization': 'Bearer sadasd' }
      expect(response.status).to equal(401)
    end

    it 'returns status 401 when request for tasks of today with wrong token' do
      get '/tasks/today', headers: { 'Authorization': 'Bearer sadasd' }
      expect(response.status).to equal(401)
    end

    it 'returns status 401 when request for tasks of yesterday with wrong token' do
      get '/tasks/today', headers: { 'Authorization': 'Bearer sadasd' }
      expect(response.status).to equal(401)
    end
  end
end
