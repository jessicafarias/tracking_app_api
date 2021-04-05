require 'rails_helper'

describe 'Change password - User', type: :request do
  describe 'patch #create' do
    context 'with invalid params' do
      it 'should return 401 - missing access token' do
        patch '/users/passwords'

        expect(response).to have_http_status(401)
        expect(response_errors).to eq('Access token is missing in the request')
      end

      it 'should return 401 - invalid access token' do
        patch '/users/passwords', headers: { 'Authorization': 'Bearer 123213' }

        expect(response).to have_http_status(401)
        expect(response_errors).to eq('Invalid access token')
      end

      it 'should return 401 - expired access token' do
        user = create(:user)
        expired_access_token = jwt_and_refresh_token(user, 'user', true)[0]

        patch '/users/passwords', headers: { 'Authorization': "Bearer #{expired_access_token}" }

        expect(response).to have_http_status(401)
        expect(response_errors).to eq('Access token expired')
      end

      it 'should return 422 - invalid password confirmation' do
        user = create(:user)
        access_token, refresh_token = jwt_and_refresh_token(user, 'user')

        patch '/users/passwords',
              params: { password: 'api-pass', password_confirmation: 'api-pppp' },
              headers: { 'Authorization': "Bearer #{access_token}", 'Refresh-Token': refresh_token }

        expect(response).to have_http_status(422)
        expect(response_errors).to eq("Password confirmation doesn't match Password")
      end
    end
  end
end
