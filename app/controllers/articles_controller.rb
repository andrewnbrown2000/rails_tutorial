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

  def edit
    @article = Article.find(params[:id]) # i think this pulls the param "id" from the actual url path
                                                # not the db; but then it locates it in the db
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    # gonna need to add something else that allows for deleting comments later, since there will be
    # a oneToMany relationship. deleting an article with comments will strand lingering comments in db

    redirect_to root_path, status: :see_other
  end

  private
    def article_params
      params.require(:article).permit(:title, :body)
    end
end
