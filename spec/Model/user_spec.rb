require 'rails_helper'

RSpec.describe User do
  let(:other_user) { User.create(name: 'Pedro') }
  let(:subject) do
    described_class.new(
      name: 'Santiago'
    )
  end

  describe 'validations' do
    it 'is valid with valid attribute' do
      expect(subject).to be_valid
    end

    it 'The name of the user should exist' do
      subject.name = ''
      expect(subject).to_not be_valid
    end

    it 'The name of the user should be longer than 5 characters' do
      subject.name = 'test'
      expect(subject).to_not be_valid
    end

    it 'The name of the user should be unique' do
      other_user
      subject.name = 'Pedro'
      expect(subject).to_not be_valid
    end
  end

  describe 'Associations', type: :model do
    it { should have_many(:savings) }
    it { should have_many(:projects) }
  end
end
