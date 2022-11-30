class Admin::BlogCategoriesController < Admin::BaseController
  before_action :find_blog_category, only: [:edit, :update, :destroy]

  def index
    @blog_categories = BlogCategory.all
  end
  def new
    @blog_category = BlogCategory.new
  end

  def create
    @blog_category = BlogCategory.new(name: params[:blog_category][:name])
    if @blog_category.save
      flash[:notice] = 'Blog Category created Successfully'
      redirect_to admin_root_path
    else
      flash[:alert] = 'Blog Category not created check Errors'
      render 'new'
    end
  end

  def edit; end

  def update
    if @blog_category.update(name: params[:blog_category][:name])
      flash[:notice] = 'Blog Category updated Successfully'
      redirect_to admin_blog_categories_path
    else
      flash[:alert] = 'Blog Category not updated check Errors'
      render 'edit'
    end
  end
  def destroy
    if @blog_category.destroy
      flash[:notice] = 'Blog Category deleted Successfully'
      redirect_to admin_blog_categories_path
    end
  end

  private

  def find_blog_category
    @blog_category = BlogCategory.find(params[:id])
  end
end
