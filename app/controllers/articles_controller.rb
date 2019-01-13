class ArticlesController < ApplicationController
  def new
    # sukuriamas kintamasis, kad galėtume naudoti formą new.html.erb
    @article = Article.new
  end

  def create
    # json išvedimas
    # render plain: params[:article].inspect
    @article = Article.new(article_params)
    @article.save
    redirect_to articles_show(@article)
  end

  private
  def article_params
    params.require(:article).permit(:title, :description)
  end
end