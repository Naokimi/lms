class Api::V1::UsersController < ActionController::API
  def create
    @user = User.new(user_params)

    begin
      @user.save!
      token = TokenRequester.new.call
      @user.update(token: token)
      # render json: user, status: :created
      render :show, status: :created
    rescue StandardError => e
      render json: e, status: 500
    end
  end

  # login

  # admin

  # regular subscription

  # premium subscription

  private

  def user_params
    params.permit(:email, :first_name, :last_name)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
