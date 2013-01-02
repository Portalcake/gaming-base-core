class Admin::NewsFeedsController < AdminController

  def index
    respond_with(@feeds = NewsFeed.all)
  end


  def new
    respond_with(@feed = NewsFeed.new)
  end

  def edit
    @feed = NewsFeed.find(params[:id])

    respond_with(@feed)
  end

  def create
    @feed = NewsFeed.new(params[:news_feed])

    respond_to do |format|
      if @feed.save
        format.html { redirect_to news_feeds_path, notice: 'News-Feed was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  def update
    @feed = NewsFeed.find(params[:id])

    respond_to do |format|
      if @feed.update_attributes(params[:news_feed])
        format.html { redirect_to news_feeds_path, notice: 'News-Feed was successfully updated.' }
      else
        format.html { render action: "index", alert: 'Invalid specifications.' }
      end
    end
  end

  def destroy
    @feed = NewsFeed.find(params[:id])

    @feed.destroy

    respond_to do |format|
      format.html { redirect_to news_feeds_url }
    end
  end
end
