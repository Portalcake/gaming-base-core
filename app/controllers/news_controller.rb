class NewsController < ApplicationController

  def index
    respond_with(@news = News.page(params[:page]))
  end

  def show
    respond_with(@news = News.find(params[:id]))
  end
end
