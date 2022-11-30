class Admin::DashboardsController < Admin::BaseController

  def index
    @recent_posts = BlogPost.all.order("created_at DESC").limit(3)
  end
end
