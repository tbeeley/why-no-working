class PostsController < ApplicationController
	before_action :authenticate_user!

		#Try doing current_user.posts
		#This will allow only access to posts by current user. 
		#I'm not sure I wan't this. Instead I want posts to be viewed with post owner specified. 

	#GET
	def index
		@posts = Post.all
	end

	def show
	end

	#GET
	def new 
		@post = Post.new
	end

	#POST
	def create
		@post = Post.new(params[:post].permit(:title, :picture))
		@post.save
		redirect_to '/posts'
	end

end
