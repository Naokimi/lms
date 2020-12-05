class Api::V1::SecureController < ActionController::API
  before_action :authorize_request

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
    if @token
      User.find_by_token(@token)
    else
      render_unauthorized
    end
  end

  def render_unauthorized
    render json: { errors: ['Not Authenticated'] }, status: :unauthorized
  end
end
