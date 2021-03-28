require 'rails_helper'

RSpec.describe Track, type: :model do
  context '#Associations' do
    it 'Track belongs to tasks' do
      association = Track.reflect_on_association(:task)
      expect(association.macro).to eq(:belongs_to)
    end
  end

  context '#Validations' do
    it 'Track invalid due to empty time' do
      expect(Track.new(time: 1, goal: 2, day: Date.today)).to_not be_valid
    end
    it 'Track invalid due to empty goal' do
      expect(Track.new(time: 1, goal: 2, day: Date.today)).to_not be_valid
    end
    it 'Track invalid due to empty goal' do
      expect(Track.new(time: 1, goal: 2, day: Date.today)).to_not be_valid
    end
    it 'Track invalid due to empty progress' do
      expect(Track.new(time: 1, goal: 2, day: nil)).to_not be_valid
    end
    it 'Track invalid due to empty day' do
      expect(Track.new(time: 1, goal: 2,day: nil)).to_not be_valid
    end
  end
end