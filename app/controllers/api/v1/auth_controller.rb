class Api::V1::AuthController < ApplicationController

  def create
    byebug
    user = User.find_by(username: params[:auth][:username])
    if user && user.authenticate(params[:auth][:password])
       # issue user a token
      payload = {user_id: user.id}
      token = JWT.encode(payload, ENV["MY_SECRET"], ENV["ALG"])
      render json: {
        token: token,
        user: user.package_json

       }

    else
      render json: {error: "Could not authorize this user"}, status: 401
    end
  end

  def show
    byebug
    token = params[:token]
    decoded_token =  JWT.decode(token, ENV['MY_SECRET'], ENV['ALG'] )
    # => [{"user_id"=>23}, {"alg"=>"HS256"}]
    user_id = decoded_token.first['user_id']
    user = User.find_by(id: user_id)
    if user
      render json: user.package_json
    else
      render json: {error: "Could not find this user. Username or password is incorrect."}, status: 401
    end
  end

end
