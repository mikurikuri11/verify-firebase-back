class Api::V1::AuthenticationsController < ApplicationController
  def create
    if current_user
      unless @is_new_user
        render json: { status: 'success', message: "User successfully logged in!" }
      end
    else
      render status: :unauthorized, json: { status: 'ERROR', message: 'No current user' }
    end
  end
end