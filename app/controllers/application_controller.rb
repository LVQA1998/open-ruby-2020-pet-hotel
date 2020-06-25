class ApplicationController < ActionController::Base
  private

  def default_url_options
    {locale: I18n.locale}
  end
end
