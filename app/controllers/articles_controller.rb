class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  impressionist :action => :show
  # before_filter :require_permission, only: [:edit, :destroy]

  # GET /articles
  # GET /articles.json

  def index
    if params[:category]
      @articles = Article.where(:category => params[:category]).order("created_at DESC")
      @message = ""
      if @articles.empty?
        flash[:notice]
      end
    else
      @message = "News "
      @articles = Article.all.order("created_at DESC")
    end
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    if params[:id]
      @article = Article.friendly.find(params[:id])
      @categories = Article.where(:category => @article.category_id).all_except(@article).limit(4)
    end
    @owner = Article.friendly.find(params[:id]).user
    @message = "* Subscribe with us and Leave us your comment"
  end

  # GET /articles/new
  def new
    @article = Article.new
    authorize! :create, @article
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles
  # POST /articles.json
  def create
    #@article = Article.new(article_params)
    @article = current_user.articles.build(article_params)
    authorize! :create, @article

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    authorize! :edit, @article
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    authorize! :destroy, @article
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # def require_permission
  #   if current_user != @owner
  #     redirect_to root_path
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:title, :content, :image, :author, :category_id, :created_at, :updated_at)
    end
end
