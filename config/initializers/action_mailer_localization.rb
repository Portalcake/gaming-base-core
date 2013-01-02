class ActionMailer::Base
  def url_options
    #logger.debug "default_url_options is passed options: #{options.inspect}\n"
    { :locale => I18n.locale }.merge(super)
  end
end