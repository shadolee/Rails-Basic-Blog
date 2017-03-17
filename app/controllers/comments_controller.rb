class CommentsController < ApplicationController

  http_basic_authenticate_with name: "Lee",
                           password: "password",
                               only: :destroy
# only authenticated users can delete comments

  def create
    @article = Article.find(params[:article_id])
# looks for article ID to match to comment
    @comment = @article.comments.create(comment_params)
# creates new comment
    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find(params[:article_id])
# finds the article you are looking at
    @comment = @article.comments.find(comment_params)
# locates the comment within collection
    @comment.destroy
    redirect_to article_path(@article)
# removes comment from database & sends user back to article -->
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end
