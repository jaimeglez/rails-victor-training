class ArticlesController < ApplicationController
  before_filter :find_user, except: [:new]

  def index
    binding.pry
    @articles = Article.where(user_id: @user.id)
  end

  def new
    @article = Article.new
  end

  def create
    @article = @user.articles.create(article_params)

    if @article.save
      redirect_to user_articles_path(@user)
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
      redirect_to user_articles_path(@user)
    else
      render 'edit'
    end
  end

  private
    def article_params
      params.require(:article).permit(:title, :text)
    end

    def find_user
      @user= User.find(params[:user_id])
    end
end
