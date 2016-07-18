class NewsController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_news, only: [:show, :edit, :update, :delete, :destroy]

  def index
    @news = News.all
  end

  def new
    @news = News.new
  end

  def create
    @news = News.new(news_params)
    if @news.save
      redirect_to @news
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @news.update(update_params)
      redirect_to @news
    else
      render :edit
    end
  end

  def delete
  end

  def destroy
    @news.destroy
    redirect_to @news
  end

  def update_params; create_params end

  private

    def news_params
      params.require(:news).permit(:title, :description, :body, :main_page, :published)
    end

    def find_news
      @news = News.find(params[:id])
    end
end
