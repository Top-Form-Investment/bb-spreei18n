module SpreeI18n
  # The fact this logic is in a single module also helps to apply a custom
  # locale on the spree/api context since api base controller inherits from
  # MetalController instead of Spree::BaseController
  module ControllerLocaleHelper
    extend ActiveSupport::Concern

    included do
      prepend_before_action :set_user_language

      private

      # Overrides the Spree::Core::ControllerHelpers::Common logic so that only
      # supported locales defined by SpreeI18n::Config.available_locales can
      # actually be set
      def set_user_language
        I18n.locale = if session.key?(:locale) && Config.available_locales.include?(session[:locale].to_sym)
          session[:locale]
        elsif respond_to?(:config_locale, true) && !config_locale.blank?
          config_locale
        else
          Rails.application.config.i18n.default_locale || I18n.default_locale
        end
      end
    end
  end
end
