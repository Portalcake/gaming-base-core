class NewsFeed < ActiveRecord::Base

  attr_accessible :title, :feed_url, :game_id

  validates :feed_url, :presence=>true

  belongs_to :game, :inverse_of => :news_feeds

  default_scope includes(:game)


  def title
    self[:title] || self.feed_url
  end

  def self.update!
    NewsFeed.all.each do |news_feed|
      begin
        feed = Feedzirra::Feed.fetch_and_parse(news_feed.feed_url, :timeout => 30)
        if feed.is_a?(Fixnum)
          news_feed.last_error = "#{Time.now} :: Error: #{feed}"
          return
        end

        feed.entries.each do |feed_entry|

          next if news_feed.last_accessed && feed_entry.published <= news_feed.last_accessed

          news = news_feed.game ? news_feed.game.news.create : News.create
          news.update_attributes({
            :title=>feed_entry.title,
            :author=>feed_entry.author,
            :content=>feed_entry.content,
            :published=>feed_entry.published,
            :url=>feed_entry.url
            }, :without_protection => true
          )
        end

        news_feed.last_accessed = Time.now
        news_feed.last_error = nil
      rescue
        news_feed.last_error = "#{Time.now} :: #{$!}"
      end
      news_feed.save
    end
  end
end
