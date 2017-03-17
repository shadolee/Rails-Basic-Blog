class ArticlesController < ApplicationController

  http_basic_authenticate_with name: "Lee",
                           password: "password",
                             except: [:index, :show]
# authenicates user with name & password,
# unauthorised users can still access index & show pages

  def index
    @articles = Article.all
    # show all articles
  end

  def show
    @article = Article.find(params[:id])
    # find the article we're interested in
    # passes in params[:id] to get the :id parametre from the request
    # @ holds a reference to the article object
    # Rails will pass all instance variables to the view
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(params.require(:article).permit(:title, :text))
    # initialised attribute which are automatically mapped to database

    if @article.save    # saves article in database if valid
    redirect_to @article
  else render 'new'   # if invalid goes back to new post page

   end
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
  end

  private
    def article_params
      params.require(:article) .permit(:title, :text)
    end
end
