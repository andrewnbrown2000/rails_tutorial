class ArticlesController < ApplicationController
  def index
    @articles = Article.all #gets all articles from the database
  end

  def show
    @article = Article.find(params[:id])
  end   # params[:id] is taken from the routes file
  # if the article ID is 1, then it would be articles/1

end
