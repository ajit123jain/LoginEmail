class HomeController < ApplicationController
  def index
  	@user = User.last
  	@authors = Author.all
  	@posts = Post.all
  end
end
