# frozen_string_literal: true

module Api
  module V1
    class ApplicationController < ActionController::API
      include ActionController::HttpAuthentication::Token::ControllerMethods

      before_action :authenticate!

      private

      def authenticate!
        authenticate_or_request_with_http_token do |token, _options|
          Merchant.find_by(token: token)
        end
      end

      def current_user
        @current_user ||= authenticate!
      end
    end
  end
end
