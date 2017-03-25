class RanksController < ApplicationController
  def index
    @ranks = Favorite.group('question_id').count.sort{|a,b| b[1] <=> a[1]}
    @questions = []
    # 上位20位
    for num in 0...20 do
      @questions.push(Question.find(@ranks[num][0]))
    end
  end
end
