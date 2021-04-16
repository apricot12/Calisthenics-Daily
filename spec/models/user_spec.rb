require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validation' do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
  end

  context 'associations' do
    it { should have_many(:articles) }
    it { should have_many(:votes) }
  end
end
