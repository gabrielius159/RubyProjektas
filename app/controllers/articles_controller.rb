class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def new
    # sukuriamas kintamasis, kad galėtume naudoti formą new.html.erb
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def show
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(article_params)
    # json išvedimas
    # render plain: params[:article].inspect
    if @article.save
      flash[:notice] = "Article was successfully created"
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      flash[:notice] = "Article was successfully updated"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end



  private
  def article_params
    params.require(:article).permit(:title, :description)
  end
end