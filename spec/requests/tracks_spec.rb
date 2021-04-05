require 'rails_helper'

RSpec.describe 'Tracks', type: :request do
  let(:task) do
    {
      name: 'Image',
      expiration_day: Date.today + 1,
      img: 'http://res.cloudinary.com/ddcakt97r/image/upload/v1599940689/event_center/meta-studio-35-PJXAjKduyjQ-unsplash_onzzzc.jpg'
    }
  end
  describe 'Testing Track controller' do
    it 'Increase the time invest on certain track with user authentication' do
      user = create(:user)
      task = user.tasks.create(name:'image', expiration_day: Date.today, img: 'as')
      track = task.tracks.create(time: 1, goal:2, progress: 50)
      
      access_token = jwt_and_refresh_token(user, 'user')[0]
      patch "/tracks/#{track.id}", headers: { 'Authorization': "Bearer #{access_token}" }
      expect(response.status).to equal(200)
    end

    it 'Show track' do
      user = create(:user)
      task = user.tasks.create(name:'image', expiration_day: Date.today, img: 'as')
      track = task.tracks.create(time: 1, goal:2, progress: 50)
      
      access_token = jwt_and_refresh_token(user, 'user')[0]
      get "/tracks/#{track.id}", headers: { 'Authorization': "Bearer #{access_token}" }
      expect(response.status).to equal(200)
    end

    it 'Delete the track and return 200 with a message' do
      user = create(:user)
      task = user.tasks.create(name:'image', expiration_day: Date.today, img: 'as')
      track = task.tracks.create(time: 1, goal:2, progress: 50)
      
      access_token = jwt_and_refresh_token(user, 'user')[0]
      delete "/tracks/#{track.id}", headers: { 'Authorization': "Bearer #{access_token}" }
      expect(response.status).to equal(200)
    end
  end
end
