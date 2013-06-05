class ApplicationController < ActionController::Base
  protect_from_forgery

  #only reply to html on default
  respond_to :html

  before_filter :set_locale, :set_user_time_zone

  def url_options
    { :locale => I18n.locale, :debug=>params[:debug] }.merge(super)
  end

  private

  def set_locale
    if params[:locale] && !Language.exists?(:tld => params[:locale])
      redirect_to root_url, :alert => "Language not supported"
      return
    end
    I18n.locale = (params[:locale] || I18n.default_locale)
  end

  def current_language
    Language.where(:tld=>I18n.locale).first
  end

  def set_user_time_zone
    if user_signed_in? && current_user.time_zone
      Time.zone = current_user.time_zone 
    end
  end

  #provides globaly record_not_found rescue when calling any model which cannot be found
  #user will be redirected to a friendly global 404 page 
  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found
  def record_not_found
    respond_to do |format|
      format.html {
          render :template=>'share/record_not_found', :status => :not_found
      }
      format.json { head :not_found }
    end
    return false
  end

  def redirect_on_error
    main_app.root_url
  end

  helper_method :redirect_on_error

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to redirect_on_error, :alert => exception.message
    return
  end

  def authorize!(type, object)
    type = [type] unless type.kind_of? Array
    type.each do |t|
      raise CanCan::AccessDenied unless user_can?(t, object)
    end
  end
end
