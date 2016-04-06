class ArticlesController < ApplicationController
  #before_filter :find_user, except: [:new]

  def index
    @articles = Article.page(params[:page]).per(2)
  end


  def show
    @article = Article.find(params[:id])
  end

end
