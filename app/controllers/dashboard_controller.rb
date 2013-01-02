class DashboardController < ApplicationController
  def localize
    respond_to do |format|
      format.html { 
        flash.keep
        redirect_to news_index_url
      }
    end
  end

  def start
    respond_to do |format|
      format.html { 
        flash.keep
        redirect_to news_index_url
      }
    end
  end
end
