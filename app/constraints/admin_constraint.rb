# frozen_string_literal: true

class AdminConstraint
  def matches?(request)
    request.env['warden'].user(:user)&.admin?
  end
end
