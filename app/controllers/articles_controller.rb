class ArticlesController < ApplicationController
  def index # returns the index.html.erb file
    @articles = Article.all #gets all articles from the database
  end

  def show
    @article = Article.find(params[:id])
  end   # params[:id] is taken from the routes file
  # if the article ID is 1, then it would be articles/1

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
    def article_params
      params.require(:article).permit(:title, :body)
    end
end
