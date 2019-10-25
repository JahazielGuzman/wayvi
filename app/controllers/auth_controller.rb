class AuthController < ApplicationController

  def login
    username = params["username"]
    password = params["password"]
    user = User.find_by(username: username)
    if user && user.authenticate(password)
      payload = {user_id: user.id}
      # payload, secret, algorithm
      token = JWT.encode(payload, 'blablaSECRETblabla', 'HS256')
      render json: {user: {id: user.id, username: user.username, name: user.name} , token: "Bearer #{token}"}
    else
      render json: {token: ""}
    end
  end

  def register
    username = params["username"]
    thename = params["name"]
    password = params["password"]
    user = User.find_by(username: username)
    if user
      render json: {token: ""}
    else
      created = User.create(username: username, name: thename, password: password)
      payload = {user: created.id}
      # payload, secret, algorithm
      token = JWT.encode(payload, 'blablaSECRETblabla', 'HS256')
      render json: {user: {id: created.id, username: created.username, name: created.name} , token: "Bearer #{token}"}
    end
  end

  def getUser
    token = request.headers["Authorization"].split(' ')[1]
    decoded_token = JWT.decode(token, 'blablaSECRETblabla', true, algorithm: 'HS256')
    user_id = decoded_token[0]["user_id"]
    user = User.find_by(id: user_id)
    if user
      render json: {id: user_id, username: user.username, name: user.name}
    else
      render json: {}
    end
  end

end
