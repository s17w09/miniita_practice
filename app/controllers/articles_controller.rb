class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.build(article_params)

    if @article.save!
      redirect_to article_path(@article)
    else
      render :new
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  private

  def article_params
    params.require(:article).permit(:title, :body)
  end
end
