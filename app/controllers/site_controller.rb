class SiteController < ApplicationController

  def index
  	#Change this to by Post.score
  	@posts = Post.order('created_at desc')
  end

end
