class ArticlesController < ApplicationController
  #before_filter :find_user, except: [:new]

  def index
    @articles = Article.all
  end


  def show
    @article = Article.find(params[:id])
  end

end
