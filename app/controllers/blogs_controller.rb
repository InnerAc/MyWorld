class BlogsController < PermissionController
  before_action :set_blog, only: [ :edit, :update, :destroy]
  before_action :set_avatar, only: [ :create, :update, :new,:edit]

  # GET /blogs
  # GET /blogs.json
  def index
    @blogs = Blog.order(created_at: :desc)
  end

  # GET /blogs/1
  # GET /blogs/1.json
  def show
    begin
      @blog = Blog.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      logger.error "访问出错"
      redirect_to index_path, :notice =>'Invalid blog'
      return
    else
      respond_to do |format|
        format.html # index.html.erb
     end
   end
  end

  # GET /blogs/new
  def new
    @blog = Blog.new
  end

  # GET /blogs/1/edit
  def edit
    
  end

  # POST /blogs
  # POST /blogs.json
  def create
    @blog = Blog.new(blog_params)

    respond_to do |format|
      if @blog.save
        format.html { redirect_to @blog, notice: 'Blog was successfully created.' }
        format.json { render :show, status: :created, location: @blog }
      else
        format.html { render :new }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blogs/1
  # PATCH/PUT /blogs/1.json
  def update
    respond_to do |format|
      if @blog.update(blog_params)
        format.html { redirect_to @blog, notice: 'Blog was successfully updated.' }
        format.json { render :show, status: :ok, location: @blog }
      else
        format.html { render :edit }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blogs/1
  # DELETE /blogs/1.json
  def destroy
    @blog.destroy
    respond_to do |format|
      format.html { redirect_to blogs_url, notice: 'Blog was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      @blog = Blog.find(params[:id])
    end

    def set_avatar
      @avatars=Avatar.all
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def blog_params
      param=params.require(:blog).permit(:title, :summary, :content,:is_boy)
      param[:user_id]=session[:user_id]
      param[:avatar_id]=params[:avatar]
      return param
    end
end
