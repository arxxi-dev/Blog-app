class Admin::BlogPostsController < Admin::BaseController
  before_action :find_blog_categories, only: [:new, :create, :edit, :update]
  before_action :find_blog_post, only: [:show, :edit, :update, :destroy]

  def index
    @blog_posts = BlogPost.all
  end

  def new
    @blog_post = BlogPost.new
  end

  def create
    @blog_post = BlogPost.new(blog_post_params)
    if @blog_post.save
      flash[:notice] = 'Blog Post created Successfully'
      redirect_to admin_root_path
    else
      flash[:alert] = @blog_post.errors.full_messages.join(', ')
      render 'new'
    end
  end

  def edit; end

  def update
    if @blog_post.update(blog_post_params)
     flash[:notice] = 'Blog Post updated Successfully'
      redirect_to admin_root_path
    else
      flash[:alert] = @blog_post.errors.full_messages.join(', ')
      render 'edit'
    end
  end

  def show; end

  def destroy
    if @blog_post.destroy
      flash[:notice] = 'Blog Post deleted Successfully'
      redirect_to admin_root_path
    end
  end

  private

  def blog_post_params
    params.require(:blog_post).permit(:title, :blog_category_id, :creation_date, :visibility_state, :content)
  end

  def find_blog_categories
    @blog_categories = BlogCategory.all
  end

  def find_blog_post
    @blog_post = BlogPost.find(params[:id])
  end
end
