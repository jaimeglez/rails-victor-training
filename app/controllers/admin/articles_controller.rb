class Admin::ArticlesController < Admin::AdminController
  before_filter :find_user, except: [:new]

  def index
    @articles = Article.where(user_id: @user.id).page(params[:page])
  end

  def new
    @article = Article.new
  end

  def create
    @article = @user.articles.create(article_params)

    if @article.save
      redirect_to admin_user_articles_path(@user)
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
      redirect_to admin_user_articles_path(@user)
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to admin_user_articles_path(@user)
  end

  private
    def article_params
      params.require(:article).permit(:title, :text, :img)
    end

    def find_user
      @user= User.find(params[:user_id])
    end
end
