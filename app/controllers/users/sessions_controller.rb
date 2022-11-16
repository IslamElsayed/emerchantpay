# frozen_string_literal: true

module Users
  class SessionsController < Devise::SessionsController
    skip_before_action :verify_authenticity_token, if: proc { |c| c.request.format == 'application/json' }
    respond_to :json
  end
end
