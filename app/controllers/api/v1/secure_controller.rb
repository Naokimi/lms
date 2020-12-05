class Api::V1::SecureController < ActionController::API
  include Pundit

  before_action :authorize_request

  private

  def authorize_request
    p request.headers
    @token = request.headers['Authorization'].split(' ').last if request.headers['Authorization'].present?
    AuthorizationService.new(@token).authenticate_request! if @token
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
end
