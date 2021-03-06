class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update]

  add_breadcrumb "商品"

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.page(params[:page]).includes(:post_images)
    @image = PostImage.first
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    add_breadcrumb @post.title, :post_path
  end

  # GET /posts/new
  def new
    @post = Post.new
    @post.post_images.build
    add_breadcrumb '管理者メニュー', :menu_path
    add_breadcrumb '出品', :new_post_path
  end

  # GET /posts/1/edit
  def edit
    add_breadcrumb @post.title, :post_path
    add_breadcrumb '商品情報の編集', :edit_post_path
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :price, :body, :category_id, post_images_images: [])
    end
    def correct_user
      post = Post.find(params[:id])
      if current_user.admin?
      else
        if current_user.id != post.user.id
          redirect_to new_user_session_path
        end
      end
    end
end
