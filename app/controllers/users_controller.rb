class UsersController < ApplicationController
  skip_before_action :authorize_request, only: [:create]

  # GET /users
  def index
    @users = User.all
    render json: @users
  end

  # GET /users/1
  def show
    json = Rails.cache.fetch("user#{params[:id]}") do
      User.where(id:[params[:id]]).to_json()
    end
    render json: @user
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private
    # Only allow a trusted parameter "white list" through.
    def user_params
      params.permit(:user).allow(:username, :name, :password)
    end
end
