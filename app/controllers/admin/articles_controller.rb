class Admin::ArticlesController < Admin::AdminController
  before_filter :find_admin

  def index
    @articles = @admin.articles.page(params[:page])
  end

  def new
    @article = Article.new
  end

  def create
    @article = @admin.articles.create(article_params)

    if @article.save
      redirect_to admin_admin_articles_path(@admin)
    else
      render 'new'
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
    @article= Article.find(params[:id])
  end

  def update
    @article= Article.find(params[:id])
    if @article.update(article_params)
      redirect_to admin_admin_articles_path(@admin)
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to admin_admin_articles_path(@admin)
  end

  private
    def article_params
      params.require(:article).permit(:title, :text, :img)
    end

    def find_admin
      @admin= Admin.find(params[:admin_id])
    end
end
