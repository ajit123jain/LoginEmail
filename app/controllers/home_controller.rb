class HomeController < ApplicationController
  def index
  	@users = User.all
  	@authors = Author.all
  end
end
