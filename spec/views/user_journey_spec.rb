require 'rails_helper'

# rspec spec/views/user_spec.rb
RSpec.describe 'User Experience', type: :system do
  let(:test_user_1) { User.create(id: 1, name: 'Test User 1', password: 'secret', password_confirmation: 'secret') }
  let(:test_project_1) { Project.create(name: 'Test Project', goal: 10_000, user_id: 1) }

  describe 'New user' do
    it 'User sign-up and login is correct' do
      # Access Home Page
      visit('/welcome')

      # Go to Sign Up page
      click_link('Sign Up')

      # Sign up
      fill_in('user[name]', with: 'John Doe')
      fill_in('user[password]', with: 'secret')
      fill_in('user[password_confirmation]', with: 'secret')
      click_button('Next')

      # Login
      fill_in('name', with: 'John Doe')
      fill_in('password', with: 'secret')
      click_button('Log in')

      # Logout
      click_link('Sign out')
    end
  end

  describe 'Make a saving with no project' do
    it 'path is correct' do
      test_user_1
      test_project_1

      # Access Home Page
      visit('/')
      # Login as the user

      visit('/login')
      fill_in('name', with: 'Test User 1')
      fill_in('password', with: 'secret')
      click_button('Log in')

      # Go to all of your savings with projects
      click_link('All my savings')

      # Add a new saving
      click_link('Add a saving')

      # Add saving
      fill_in('saving[name]', with: 'Test contribution with no project')
      fill_in('saving[amount]', with: 1000)
      click_button('Save')

      # Review contribution
      click_link('Contributions without project')
      expect(page).to have_content('Total: $1,000')
    end
  end

  describe 'Make a saving with project' do
    it 'path is correct' do
      test_user_1
      test_project_1

      # Login as the user
      visit('/login')
      fill_in('name', with: 'Test User 1')
      fill_in('password', with: 'secret')
      click_button('Log in')

      # Go to all of your savings with projects
      click_link('All my savings')

      # Add a new saving
      click_link('Add a saving')
      fill_in('saving[name]', with: 'Test contribution with project')
      fill_in('saving[amount]', with: 1000)
      select('Test Project', from: 'saving[project_id]')
      click_button('Save')

      # Review contribution
      click_link('All my savings')
      expect(page).to have_content('Total: $1,000')
    end
  end

  describe 'Create a Project' do
    it 'path is correct' do
      test_user_1

      # Login as the user
      visit('/login')
      fill_in('name', with: 'Test User 1')
      fill_in('password', with: 'secret')
      click_button('Log in')

      # Go to all of your savings with projects
      click_link('All projects')

      # Add a new saving
      click_link('Create a Project')
      fill_in('project[name]', with: 'My testing Project')
      fill_in('project[goal]', with: 100_000)
      attach_file('project[image]', Rails.root + 'app/assets/images/piggy_img.png', make_visible: true)
      click_button('Save')

      # Review Project
      expect(page).to have_content('My Projects')
      expect(page).to have_content('My testing Project')
    end
  end
end
