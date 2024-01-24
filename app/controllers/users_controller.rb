class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]

  def new
    @user = User.new
  end

  def show
  end

  def create
    @user = User.new(user_params)
  
    if @user.save
      redirect_to @user, notice: 'Cadastro criado com sucesso!'
    else
      render :new
    end
  end
  
  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:full_name, :location, :email, :password, :password_confirmation, :bio)
  end
  
end