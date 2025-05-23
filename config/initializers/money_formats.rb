module MoneyFormats
  include ActionView::Helpers::NumberHelper

  def display_as_money(options = {})
    en_options = I18n.translate("number.currency.format", locale: "en")
    precision = self.to_i == self ? 0 : en_options[:precision]
    options.merge!(unit: en_options[:unit], precision: precision)
    number_to_currency(self, options)
  end

  def display_as_percentage(options = {})
    en_options = I18n.translate("number.currency.format.precision", locale: "en")
    precision = self.to_i == self ? 0 : en_options
    options.merge!(unit: "%", precision: precision)
    number_to_percentage(self, options)
  end
end

[ NilClass, Float, Integer, BigDecimal ].each do |klass|
  klass.include(MoneyFormats)
end
