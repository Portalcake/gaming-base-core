module ApplicationHelper

  def title(page_title)
    content_for(:title) { "MyChars" } unless content_for?(:title)
    content_for(:title) { " - #{page_title}" }
  end

  def gravatar(email, size=38) 
    gravatar_id = Digest::MD5::hexdigest(email).downcase 
    "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}&d=identicon&r=PG" 
  end
  

  def build_page_navigation
    Proc.new do |primary|
      primary.item :ro2, "Ragnarok 2", ragnarok2.root_path
      primary.item :rose, "Rose", rose.root_path
    end
  end

  def booleanize_string(string, bool)
    content_tag(:span, string, :class=>"booleanize_#{bool}".downcase)
  end
end
