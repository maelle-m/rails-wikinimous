class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end


  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to article_path(@article), notice: "Added to the article list!"
    else
      render :edit
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    puts "Submitted parameters: #{params.inspect}"
    if @article.update(article_params)
      redirect_to article_path(@article), notice: "Article edited!"
    else
      render :edit
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to article_path, status: :see_other, notice: "Article deleted!"
  end

  private

  def article_params
    params.require(:article).permit(:title, :content)
  end
end
