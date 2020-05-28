require 'rails_helper'

RSpec.describe 'User registration', type: :feature do

	context "As a non-logged in user not registered" do
		it "successfully registers user" do
			visit signup_path
			fill_in "user_email", with: "fake@fake.com"
			fill_in "user_password", with: "password!"
			fill_in "user_password_confirmation", with: "password!"
			click_on "commit"
			expect(page).to have_content("confirmation link")
		end

		it "does not successfully register user" do
			visit signup_path
			fill_in "user_email", with: "fake@fake.com"
			fill_in "user_password", with: "password!"
			fill_in "user_password_confirmation", with: "password"
			click_on "commit"
			expect(page).to have_content("Password confirmation doesn't match Password")
		end
	end
end
