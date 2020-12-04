class Api::V1::SecureController < ActionController::API
  before_action :authorize_request

  private

  def authorize_request
    AuthorizationService.new(request.headers).authenticate_request!
  rescue JWT::VerificationError, JWT::DecodeError
    token = request.headers['Authorization'].split(' ').last if request.headers['Authorization'].present?
    user = User.find_by_token(token)
    user.update(token: nil)
    render json: { errors: ['Not Authenticated'] }, status: :unauthorized
  end
end
