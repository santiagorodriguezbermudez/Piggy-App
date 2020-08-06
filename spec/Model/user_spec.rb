require 'rails_helper'

RSpec.describe User do
  let(:other_user) { User.create(name: 'Pedro', password: 'secret', password_confirmation: 'secret') }
  let(:subject) do
    described_class.new(
      name: 'Santiago',
      password: 'secret',
      password_confirmation: 'secret'
    )
  end

  describe 'validations' do
    it 'is valid with valid attribute' do
      expect(subject).to be_valid
    end

    it 'The password of the user should exist' do
      subject.password_digest = ''
      expect(subject).to_not be_valid
    end

    it 'Password is not the same' do
      subject.password_confirmation = 'wrong'
      expect(subject).to_not be_valid
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
