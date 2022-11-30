module VisitorsHelper

  def category_blog_posts(blog_posts)
    blog_posts.where(visibility_state: 'visible')
  end
end
