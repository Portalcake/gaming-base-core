class DashboardController < ApplicationController
  def localize
    respond_to do |format|
      format.html { 
        flash.keep
        redirect_to dashboard_url
      }
    end
  end

  def start
    respond_with()
  end
end
