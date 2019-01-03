class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    puts params
    #binding.pry
    if params.present?
     # binding.pry
      params[:user].each do |key,val|
        post = Post.new
        post.to = val['email']
        post.subject = val['subject']
        post.content = val['content'] 
        post.save!
        UserNotifier.post_submit(post).deliver  
      end
    end
    @posts = Post.all

  end

  def save
    @author = Author.new
  end

end
