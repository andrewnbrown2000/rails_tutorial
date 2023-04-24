class CommentsController < ApplicationController

  http_basic_authenticate_with name: "dhh", password: "secret", only: :destroy
  def create
    @article = Article.find(params[:article_id]) # must find article first in db and then find comments
                                                  # on that article
    @comment = @article.comments.create(comment_params)

    redirect_to article_path(@article) # this essentially just reloads the page. without this
                                                  # the comment would be added to the article, but it
                                                  # wouldn't show right away until u refresh
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article), status: :see_other
  end

  private
  def comment_params
    params.require(:comment).permit(:commenter, :body, :status)
  end
end
