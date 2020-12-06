class Api::V1::SecureController < ActionController::API
  include Pundit

  before_action :authorize_request
  before_action :set_raven_context

  private

  def authorize_request
    @token = request.headers['Authorization'].split(' ').last if request.headers['Authorization'].present?
    AuthorizationService.new(@token).authenticate_request!
  rescue JWT::VerificationError, JWT::DecodeError
    user = current_user
    user&.update(token: nil)
    render_unauthorized
  end

  def current_user
    User.find_by_token(@token)
  end

  def render_unauthorized
    render json: { errors: ['Not Authenticated'] }, status: :unauthorized
  end

  def render_error(errors)
    render json: { errors: errors }, status: 422
  end

  def set_raven_context
    Raven.user_context(id: current_user.id)
    Raven.extra_context(params: params.to_unsafe_h, url: request.url)
  end
end
