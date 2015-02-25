require 'rails_helper'

describe 'posts' do
	context 'no posts' do
		
		it 'shows a message' do
			visit '/posts'
			expect(page).to have_content('No posts yet')
		end 

	end

	context 'with posts' do

		before do
			Post.create(title: 'Pls make website')
		end

		it 'display a list of all posts' do
			visit '/posts'
			expect(page).to have_content('Pls make website') 
		end
	end
	
	describe 'creating posts' do

		it 'adds the posts from a form' do
			visit '/posts'
			click_link 'New post'
			fill_in 'Title', with: 'Pls make website'			
			click_button 'Create post'

			expect(page).to have_content('Pls make website')
			expect(current_path).to eq '/posts'
		end

		it 'can attach an image to a post' do
			visit '/posts'
			click_link 'New post'
			fill_in 'Title', with: 'Pls make website'	
			attach_file 'Picture', Rails.root.join('spec/images/turtle.jpg')
			click_button 'Create post'

			expect(page).to have_css 'img.uploaded-pic'		
		end
	end

end