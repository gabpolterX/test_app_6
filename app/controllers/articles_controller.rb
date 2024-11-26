class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all
  end
  def show
  end
  def new
    @article = Article.new
  end

  def edit
  end

  def create
    @article = Article.new(permit_title_and_description)
    @article.user = User.first
    if @article.save
      flash[:notice] = "Article was saved successfully."
      redirect_to @article
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def update
    if @article.update(permit_title_and_description)
      flash[:notice] = "Article was succesfully updated"
      redirect_to @article
    else
      render 'edit', status: :unprocessable_entity
    end
  end
  
  def destroy
    @article.destroy
    redirect_to articles_path
  end

  private
  
  def set_article
    @article = Article.find(params[:id]) 
  end
  
  def permit_title_and_description
    params.require(:article).permit(:title, :description)
  end

end