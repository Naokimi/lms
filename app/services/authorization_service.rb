class AuthorizationService
  def initialize(token = '')
    @token = token
    p token
  end

  def authenticate_request!
    verify_token
  end

  private

  def verify_token
    JsonWebToken.verify(@token)
  end
end
