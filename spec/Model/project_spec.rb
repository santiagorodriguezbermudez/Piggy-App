require 'rails_helper'

RSpec.describe Project do
  let(:test_user) { User.create(name: 'Example User', password: 'secret', password_confirmation: 'secret') }
  let(:subject) do
    described_class.new(
      name: 'Testing Project',
      goal: 10_000,
      user_id: test_user.id
    )
  end

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a name' do
      subject.name = ''
      expect(subject).to_not be_valid
    end

    it 'is not valid without a goal' do
      subject.goal = ''
      expect(subject).to_not be_valid
    end

    it 'is not valid with a goal smaller than 1' do
      subject.goal = 0
      expect(subject).to_not be_valid
    end

    it 'is not valid with a name smaller than 5 characters' do
      subject.name = 'test'
      expect(subject).to_not be_valid
    end

    it 'it has a default image when the picture does not uploads' do
      expect(subject.image.url).to eql('user.svg')
    end
  end

  describe 'Associations', type: :model do
    it { should belong_to(:user) }
    it { should have_many(:savings) }
  end
end
