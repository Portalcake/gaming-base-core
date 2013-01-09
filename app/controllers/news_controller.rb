class NewsController < ApplicationController

  before_filter :authenticate_user!, :except => [:show, :index, :latest, :gaming_base, :games]


  def index
    @news = {}
    @news[:gaming_base] = News.published.where(:game_id=>nil).limit(7)
    @news[:games] = News.published.where("news.game_id IS NOT NULL").limit(7)
    respond_with(@news)
  end

  def gaming_base
    respond_with(@news = News.published.where(:game_id=>nil).page(params[:page]))
  end

  def games
    respond_with(@news = News.published.where("news.game_id IS NOT NULL").page(params[:page]))
  end

  def show
    @news = News.find(params[:id])
    authorize!(:show, @news)
    respond_with(@news)
  end

  def new
    authorize!(:create, News)
    respond_with(@news = News.new)
  end

  def edit
    @news = News.find(params[:id])
    authorize!(:edit, @news)
    respond_with(@news)
  end

  def create
    authorize!(:create, News)
    @news = News.new(params[:news])
    @news.user = current_user

    respond_to do |format|
      if @news.save
        format.html { redirect_to @news, notice: 'News was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  def update
    @news = News.find(params[:id])
    authorize!(:update, @news)

    respond_to do |format|
      if @news.update_attributes(params[:news])
        format.html { redirect_to @news, notice: 'News was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @news = News.find(params[:id])
    authorize!(:destroy, @news)
    @news.destroy

    respond_to do |format|
      format.html { redirect_to news_index_url }
    end
  end
end
