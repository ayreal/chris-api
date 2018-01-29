class Api::V1::UsersController < ApplicationController
  def create
    user = User.new(name: params[:newName])
    user.password = params[:newPassword]
    if user.valid?
      user.save!
      payload = {user_id: user.id}
      token = JWT.encode(payload, ENV["MY_SECRET"], ENV["ALG"])
      render json: {
        token: token,
        user: user
       }
    else
      render json: {error: "Could not authorize this user"}, status: 401
    end
   end
  end
