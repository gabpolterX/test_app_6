class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :require_user, except: [:index, :show]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def index
    @articles = Article.paginate(page: params[:page], per_page: 5)

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
    @article.user = current_user
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
    params.require(:article).permit(:title, :description, category_ids: [])
  end

  def require_same_user
    if current_user != @article.user && !current_user.admin?
        flash[:alert] = "You can only edit or delete your own article"
        redirect_to @article
    end
  end

end