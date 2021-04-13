require 'rails_helper'

RSpec.describe User, type: :model do
  context '#Associations' do
    it 'User has_many tasks' do
      association = User.reflect_on_association(:tasks)
      expect(association.macro).to eq(:has_many)
    end
  end

  context '#Validations' do
    it 'User invalid due null name' do
      expect(User.new(name: nil, email: 'some@gmail.com')).to_not be_valid
    end
    it 'User invalid due null email' do
      expect(User.new(name: 'us', email: nil)).to_not be_valid
    end
  end
end
