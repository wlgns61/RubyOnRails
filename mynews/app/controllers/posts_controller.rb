class PostsController < ApplicationController
  
  
  def index
    @posts = Post.all.order('created_at desc')
    @sports = @posts.where(:category => 'Sports')
    @life = @posts.where(:category => 'Life')
    @social = @posts.where(:category => 'Social')
    @tech = @posts.where(:category => 'Technology')
    @else = @posts.where(:category => 'Else')
  end
  
  def new
  end
  
  def create
    new_post = Post.new(user_id: current_user.id, 
                        content: params[:content], 
                        title: params[:title], 
                        category: params[:category],
                        image: params[:image])
    if new_post.save  
      redirect_to root_path 
    else 
      redirect_to new_post_path 
    end
  end
  
  def content
    @post_id = params[:id]
    @post = Post.find(@post_id)
  end
  
  def mycontent
    @post_id = params[:id]
    @post = Post.find(@post_id)
  end
  
  def myhome
    @posts_count = current_user.posts.length
    @posts = Post.where(:user_id => current_user.id).order('created_at desc')
  end
  
  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    redirect_to root_path if @post.user_id != current_user.id
    
    @post.title = params[:title]
    @post.content = params[:content]
    @post.category = params[:category]
    if(params[:image])
      @post.image = params[:image]
    end
    
    if @post.save
      redirect_to root_path
    else
      render :edit
    end
  end
  
  def destroy
    @post = Post.find(params[:id])
    redirect_to root_path if @post.user_id != current_user.id
    
    @post.destroy
    redirect_to root_path
  end
  
  def category
    @category = params[:item]
    @posts = Post.all.order('created_at desc')
    if(@category != 'All')
      @posts = @posts.where(:category => params[:item])
    end
  end
  
end
