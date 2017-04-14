class ArticlesController < ApplicationController
  def new
    @article = Article.new
  end
  
  def create
    #render plain: params[:article].inspect
    @article=Article.new(article_params)
    @article.save  #saves d article created but doesnt know where to redirect after dat
  end
  
  private
  def article_params
  params.require(:article).permit(:title, :description)
  end
end