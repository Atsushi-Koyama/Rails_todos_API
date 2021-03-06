class UsersController < ApplicationController
  skip_before_action :authorize_request, only: :create
# POST /signup
# return authenticated token upon signup
  def create
    user = User.create!(user_params)
    auth_token = AuthenticateUser.new(user.email, user.password).call
    # //jsonのレスポンスメッセージの定義および、auth_tokenを返す
    response = { message: Message.account_created, auth_token: auth_token }
    json_response(response, :created)
  end

  private

  def user_params
    params.permit(
      :name,
      :email,
      :password,
      :password_confirmation
    )
  end
end
