class BlogsController< ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

# Index action to render all blogs
def index
  # @blogs = Blog.paginate(:page => params[:page])
  # @blogs = Blog.where(category:"Investment")
  # @blogs = Blog.all
  @comments = Comment.all
    if params[:search]
      @blogs = Blog.search(params[:search]).paginate(:page => params[:page]).order("created_at DESC")
    elsif params[:category]
      @blogs = Blog.where(:category => params[:category]).paginate(:page => params[:page])
    else
      @blogs = Blog.all.paginate(:page => params[:page]).order('created_at DESC')
    end

    # authorize! :read, @blogs
end
 # New action for creating blog
def new
  @greeting = "Hey #{@name}"
   @blog = Blog.new
end


# Create action saves the blog into database
def create
  @blog = Blog.new(blog_params)
    if @blog.save
    flash[:notice] = "Successfully created blog!"
    redirect_to blog_path(@blog)
    else
    flash[:alert] = "Error creating new blog!"
    render :new
    end
end

# Edit action retrives the blog and renders the edit page
def edit
end

# Update action updates the blog with the new information
def update
  if @blog.update_attributes(blog_params)
    flash[:notice] = "Successfully updated blog!"
    redirect_to blog_path(@blog)
  else
    flash[:alert] = "Error updating blog!"
    render :edit
  end
end

def show
  @comment=Comment.new

  end

def destroy

  @blog.delete
  redirect_to blog_path
end

  private

  def set_blog
      @blog = Blog.find(params[:id])
  end

  def blog_params
      params.require(:blog).permit(:title, :content, :picture, :category)
    end


end
