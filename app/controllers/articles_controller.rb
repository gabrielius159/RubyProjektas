class ArticlesController < ApplicationController
  def new
    # sukuriamas kintamasis, kad galėtume naudoti formą new.html.erb
    @article = Article.new
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

  def show
    @article = Article.find(params[:id])
  end

  private
  def article_params
    params.require(:article).permit(:title, :description)
  end
end