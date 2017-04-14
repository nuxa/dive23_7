class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  def index
    @users = User.all
  end

  def show
     @questions = @user.questions.order('created_at DESC');
     @answers = @user.answers.order('created_at DESC');
  end

  private
    def set_user
      @user = User.find(params[:id])
    end
end
