require 'rails_helper'

describe 'user management' do
	
	context 'users are not signed in' do

		it 'users can not share pictures' do
			visit '/posts'
			expect(page).not_to have_link 'New post'

		end

		it 'users can sign up' do
			visit '/posts'
			click_link 'Sign up'
			fill_in 'Email', with: 'tbeeley@hotmail.com'
			fill_in 'Password', with: '12345678'
			fill_in 'Password confirmation', with: '12345678'
			click_button 'Sign up'
			expect(page).to have_content 'Welcome! You have signed up successfully'
		end

		it 'users can sign in' do 
			user = User.create(email: 'tbeeley@hotmail.com', password: '12345678', password_confirmation: '12345678')
			visit '/users/sign_in'
			fill_in 'Email', with: 'tbeeley@hotmail.com'
			fill_in 'Password', with: '12345678'
			click_button 'Log in'
			expect(page).to have_content 'Signed in successfully.'
		end

	end

end