require 'rails_helper'

RSpec.describe TasksHelper, type: :helper do
  describe 'string concat' do
    it 'get progress' do
      @task = Task.new(name: 'sa', img: 'sdjsd', expiration_day: Date.today)
      @obj = @task.tracks.new(time: 1, goal: 2)
      expect(helper.get_progress(@obj)).to eq(50.0)
    end
  end
end
