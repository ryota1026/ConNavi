class PostsController < ApplicationController
  before_action :authenticate_user
  before_action :ensure_correct_user,{only: [:edit,:update,:destroy]}


  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def show
    @post = Post.find_by(id: params[:id])
    @user = @post.user
    @likes_count = Like.where(post_id: @post.id).count
  end

  def new
    @post = Post.new
    @select = Category.new
  end

  def create
    @post = Post.new(
      content: params[:content],
      user_id: @current_user.id,
      product_name: params[:product_name],
      product_image: params[:product_image],
      product_price: params[:product_price],
      product_score: params[:product_score],
      product_category: params[:product_category]
      )

    unless @post.save
      render("posts/new")
    end

    if params[:product_image]
      @post.product_image = "#{@post.id}.jpg"
      product_image = params[:product_image]
      File.binwrite("public/post_images/#{@post.product_image}",product_image.read)
    end

    if @post.save
      flash[:notice] ="投稿を作成しました"
      redirect_to("/posts/index")
    else
      @content = params[:content]
      @product_name = params[:product_name]
      @product_price = params[:product_price]
      @product_score = params[:product_score]
      @product_category = params[:product_category]
      render("posts/new")
    end
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    @post.content = params[:content]
    if @post.save
      flash[:notice] = "投稿を編集しました"
      redirect_to("/posts/index")
    else
      render("/posts/edit")
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    flash[:notice] = "投稿を削除しました"
    redirect_to("/posts/index")
  end

  def ensure_correct_user
    @post = Post.find_by(id: params[:id])
    if @post.user_id != @current_user.id
      flash[:notice] = "権限がありません"
      redirect_to("/posts/index")
    end
  end

end
