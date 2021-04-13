require 'rails_helper'

RSpec.describe Task, type: :model do
  context '#Associations' do
    it 'Task has many tracks' do
      association = Task.reflect_on_association(:tracks)
      expect(association.macro).to eq(:has_many)
    end
    it 'Task belongs to user' do
      association = Task.reflect_on_association(:user)
      expect(association.macro).to eq(:belongs_to)
    end
  end

  context '#Validations' do
    it 'Task invalid due to empty name' do
      expect(Task.new(name: nil, img: 'someImagehete', expiration_day: Date.today)).to_not be_valid
    end
    it 'Task invalid due to empty img' do
      expect(Task.new(name: 'kslas', img: 'someImagehete', expiration_day: Date.today)).to_not be_valid
    end
    it 'Task invalid due to empty expiration_day' do
      expect(Task.new(name: 'kslas', img: 'someImagehete', expiration_day: nil)).to_not be_valid
    end
  end
end
