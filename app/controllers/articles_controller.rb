class ArticlesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @articles = Article.where(user_id: @user.id)
  end

  def new
    @article = Article.new
  end

  def create
    @user = User.find(params[:user_id])
    @article = @user.articles.create(article_params)

    if @article.save
      redirect_to user_articles_path(@user)
    else
      render 'new'
    end
  end

  def show
    @user=User.find(params[:user_id])
    @article = Article.find(params[:id])
  end

 def edit
   @user=User.find(params[:user_id])
   @article = Article.find(params[:id])
 end

 def update
   @user = User.find(params[:user_id])
   @article=Article.find(params[:id])

   if @user.articles.update( @article, article_params)
     redirect_to user_articles_path(@user)
   else
     render 'edit'
   end
end

  private
  def article_params
    params.require(:article).permit(:title, :text)
  end
end
