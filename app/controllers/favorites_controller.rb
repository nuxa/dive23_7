class FavoritesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @favorites = @user.favorites
    @questions = []
    @favorites.each do |f|
      @questions.push(f.question)
    end
  end

  def create
    @user      = User.find(params[:user_id])
    @favorite  = @user.favorites.build(favorite_params)
    @question  = @favorite.question

    @favorites = @question.favorites

    # クライアント要求に応じてフォーマットを変更
    respond_to do |format|
      if @favorite.save
        format.html { redirect_to question_path(@question)}
        format.json { render :show, status: :created, location: @question }
        # JS形式でレスポンスを返します。
        format.js { render :index }
      else
        format.html { render :new }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @favorite = Favorite.find(params[:id])
    @question = @favorite.question

    respond_to do |format|
      if @favorite.destroy
        format.html { redirect_to(@question) }
      end
    end
  end

private
  def favorite_params
    params.require(:favorite).permit(:question_id)
  end

end
