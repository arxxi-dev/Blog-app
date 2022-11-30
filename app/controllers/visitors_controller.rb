class VisitorsController < ApplicationController
  before_action :find_blog_post, only: [:show, :comment]

  def index
    @recent_posts = BlogPost.where(visibility_state: 'visible').order("created_at DESC").limit(3)
  end

  def search_post
    search = "%#{params[:post_name].downcase}%"
    @searched_posts = BlogPost.where(visibility_state: 'visible').where("lower(title) LIKE ?", search).limit(10)
  end

  def show
    @post_comments = @blog_post.comments
  end

  def comment
    @blog_post.comments.create(comment_params)
    @post_comments = @blog_post.comments
  end

  def posts
    @blog_categories = BlogCategory.all
  end

  private

  def find_blog_post
    @blog_post = BlogPost.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:name, :comment)
  end
end
