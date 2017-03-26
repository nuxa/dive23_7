class AnswersController < ApplicationController
  before_action :set_answer, only: [:edit, :update, :destroy]

  def create
    # ログインユーザーに紐付けてインスタンス生成するためbuildメソッドを使用します。
    @answer = current_user.answers.build(answer_params)
    @question = @answer.question

    # クライアント要求に応じてフォーマットを変更
    respond_to do |format|
      if @answer.save
        format.html { redirect_to question_path(@question), notice: '回答を投稿しました。' }
        format.json { render :show, status: :created, location: @question }
        # JS形式でレスポンスを返します。
        format.js { render :index }
      else
        format.html { render :new }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @question = @answer.question
  end

  def update
    if @answer.update(answer_params)
      redirect_to question_path(@answer.question), notice: 'コメントを更新しました！'
    else
      render action: 'edit'
    end
  end

  def destroy
    respond_to do |format|
      if @answer.destroy
        format.js { render :index }
      else
        format.html { redirect_to(questions_path,) }
      end
    end
  end

  private
    def set_answer
      @answer = Answer.find(params[:id])
    end

    def answer_params
      params.require(:answer).permit(:question_id, :content)
    end

    def set_answer
      @answer = Answer.find(params[:id])
    end
end
