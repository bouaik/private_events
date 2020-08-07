require 'rails_helper'

feature "capybara features", type: :feature do
    feature "sign up a new user" do
        before(:each) do
            visit "/signup"
        end

        scenario "with invalid inputs" do
            fill_in "Name", with: "lhoussaine"
            click_on "Sign up"
            expect(page).to have_content("Email can't be blank")
        end

        scenario "with valid inputs" do
            within('form') do
                fill_in "user_name", with: "lhoussaine"
                fill_in "user_email", with: "lhoussaine@gmail.com"
            end
            click_on "Sign up"
            expect(page).to have_content("You signed up successfully.")
        end

    end
end