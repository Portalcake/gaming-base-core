module ApplicationHelper

  def title(page_title)
    content_for(:title) { "Gaming-Base" } unless content_for?(:title)
    content_for(:title) { " - #{page_title}" }
  end

  def gravatar(email, size=38) 
    gravatar_id = Digest::MD5::hexdigest(email).downcase 
    "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}&d=identicon&r=PG" 
  end
  

  def build_page_navigation
    Proc.new do |primary|
      primary.item :news, "News", news_index_path, :highlights_on=>/[a-z]{2}\/news/ do |n|
        n.item :news_latest, "Latest news", news_index_path, :highlights_on=>/[a-z]{2}\/news(\/latest)?$/
        n.item :news_gaming_base, "Gaming-Base", gaming_base_news_index_path
        n.item :news_games, "Game news", games_news_index_path
        n.item :news_add, "Create News", new_news_path, :if => Proc.new { user_can?(:create, News) }
      end
      primary.item :ro2, "Ragnarok 2", ragnarok2.root_path
      #primary.item :rose, "Rose", rose.root_path
    end
  end

  def booleanize_string(string, bool)
    content_tag(:span, string, :class=>"booleanize_#{bool}".downcase)
  end

  def link_to_blank(body, url_options = {}, html_options = {})
    link_to(body, url_options, html_options.merge(target: "_blank"))
  end

  def current_revision_string
    file = Rails.root.join("REVISION")
    return nil unless File.exists?(file)
    rev = file.open.read
    "#{rev[0...8]}, #{File.ctime(file)}"
  end
end
