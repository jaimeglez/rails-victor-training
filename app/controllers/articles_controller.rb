class ArticlesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @articles = Article.where(user_id: @user.id)
  end

  def new
    @article = Article.new
  end

  def create
    #@article = Article.new(article_params)
    @user = User.find(params[:user_id])
    @article = @user.articles.create(article_params)

    if @article.save
      redirect_to user_article_url(@user)
    else
      render 'new'
    end
  end

  def show
    @article = Article.find(params[:id])
  end

 def edit
   @article = Article.find(params[:id])
 end

 def update
   #@article = Article.find(params[:id])
   @user = User.find(params[:user_id])
   @article=@user.articles.find(:id)
   if @article.update(article_params)
     redirect_to @article
   else
     render 'edit'
   end
end

  private
  def article_params
    params.require(:article).permit(:title, :text)
  end
end
