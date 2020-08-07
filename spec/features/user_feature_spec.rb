require 'rails_helper'

feature 'capybara features', type: :feature do
  feature 'sign up a new user' do
    before(:each) do
      visit '/signup'
    end

    scenario 'with invalid inputs' do
      fill_in 'user_name', with: 'lhoussaine'
      click_on 'Sign up'
      expect(page).to have_content("Email can't be blank")
    end

    scenario 'with valid inputs' do
      within('form') do
        fill_in 'user_name', with: 'lhoussaine'
        fill_in 'user_email', with: 'lhoussaine@gmail.com'
      end
      click_on 'Sign up'
      expect(page).to have_content('You signed up successfully.')
    end
  end

  feature 'log in a user' do
    before(:each) do
      visit '/login'
    end

    scenario 'with invalid inputs' do
      fill_in 'name', with: 'lhoussaine'
      click_on 'Log in'
      expect(page).to have_content('Email or password is invalid')
    end

    scenario 'with valid inputs' do
      user = FactoryBot.create(:user)
      within('form') do
        fill_in 'name', with: user.name
        fill_in 'email', with: user.email
      end
      click_on 'Log in'
      expect(page).to have_content('Yoy logged in successfully.')
    end
  end
end
