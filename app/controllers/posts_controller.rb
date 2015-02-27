class PostsController < ApplicationController
	before_action :authenticate_user!

		#Try doing current_user.posts
		#This will allow only access to posts by current user. 
		#I'm not sure I wan't this. Instead I want posts to be viewed with post owner specified. 

	#GET
	def index
		@posts = Post.all
		# @posts = current_user.posts.order(:created_at)
	end

	# def show
	# end

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


	# private
 #  # Use callbacks to share common setup or constraints between actions.
 # 	def set_bookmark
 #      unless @post = Post.first
 #        flash[:alert] = 'Post not found.'
 #        redirect_to root_url
 #      end
 #  end

end
