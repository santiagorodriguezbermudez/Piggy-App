require 'rails_helper'

RSpec.describe Saving do
  let(:test_user) { User.create(name: 'Example User') }
  let(:test_project) { Project.create(name: 'This is a test project', user_id: test_user.id, goal: 10000) }
  
  let(:subject) do
    described_class.new(
      project_id: test_project.id,
      author_id: test_user.id,
      amount: 10,
      name: 'Test for saving transaction'
    )
  end

  describe 'validations' do

    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'The name of the saving should exist' do
      subject.name = ''
      expect(subject).to_not be_valid
    end

    it 'The amount of the saving should exist' do
      subject.amount = ''
      expect(subject).to_not be_valid
    end

    it 'The amount of the saving should be higher than 1' do
      subject.amount = 0
      expect(subject).to_not be_valid
    end
  end

  describe 'Associations', type: :model do
    it { should belong_to(:author) }
  end
end