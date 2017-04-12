class ContributesController < ApplicationController
  def create
    # @user      = User.find(params[:user_id])
    @question    = Question.find(params[:question_id])
    if !params[:answer_id]
      # Questionに対する投票
      @q_points    = @question.q_points
      @contributeQ = @question.q_points.build
      @contributeQ.user_id = current_user.id
    else
      # Answerに対する投票
      @answer    = Answer.find(params[:answer_id])
      @a_points    = @answer.a_points
      @contributeA = @answer.a_points.build
      @contributeA.user_id = current_user.id
    end

    # クライアント要求に応じてフォーマットを変更
    respond_to do |format|
      if (@contributeQ && @contributeQ.save) || ( (@contributeA && @contributeA.save))
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
    @contribute = Contribute.find(params[:id])

    if @contribute.point_q
      @question = @contribute.question
    else
      @question = @contribute.answer.question
    end

    respond_to do |format|
      if @contribute.destroy
        format.html { redirect_to(@question) }
      end
    end
  end
end
