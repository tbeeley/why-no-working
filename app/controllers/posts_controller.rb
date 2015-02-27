class PostsController < ApplicationController
	before_action :authenticate_user!

		#Try doing current_user.posts
		#This will allow only access to posts by current user. 
		#I'm not sure I wan't this. Instead I want posts to be viewed with post owner specified. 

	#GET
	def index
		@posts = current_user.posts
		# @posts = current_user.posts.order(:created_at)
	end

	def show
	end

	#GET
	def new 
		@post = current_user.posts.new
	end

	#POST
	def create
		@post = current_user.posts.new(post_params)
		@post.save
		redirect_to '/posts', notice: 'Post was successfully created'
	end

  def post_params
     params.require(:post).permit(:title, :picture, :user_id)
  end

end
