require "pagy/extras/bootstrap"
Pagy::DEFAULT[:limit] = 10
Pagy::I18n.load(*Rails.application.config.i18n.available_locales.map { |locale| { locale: locale.to_s } })
