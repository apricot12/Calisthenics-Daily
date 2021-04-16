require 'rails_helper'

RSpec.describe Article, type: :model do
  context 'validation' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:text) }
    it { should validate_presence_of(:image) }
    it { should validate_presence_of(:category) }
  end

  context 'associations' do
    it { should have_many(:votes) }
    it { should belong_to(:category) }
    it { should belong_to(:author) }
  end
end
