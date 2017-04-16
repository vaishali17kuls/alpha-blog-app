class ArticlesController < ApplicationController
    before_action :set_article, only: [:edit, :update, :show, :destroy]
  def new
    @article = Article.new
  end
  
  def index
   @articles = Article.all  #grabs ol d articles in @article variable
  end
  
  def edit
    
  end
  
  def update
    
     if @article.update(article_params)
       flash[:success] = "Article was successfully updated"
       redirect_to article_path(@article)
     else
     render 'edit'
     end
  end
  
  def create
    #render plain: params[:article].inspect
    @article=Article.new(article_params)
     if @article.save
        flash[:success] = "Article was successfully created"
        redirect_to article_path(@article)

     else
    render 'new'

     end
    #@article.save  #saves d article created but doesnt know where to redirect after dat
  end
  
  def show

  end
  
  def destroy
   @article.destroy
   flash[:danger] = "Article was successfully deleted"
   redirect_to articles_path
  end
  
  private
  def set_article
     @article = Article.find(params[:id])  #find article id 
  end
  
  private
  def article_params
  params.require(:article).permit(:title, :description)
  end
end