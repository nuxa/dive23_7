class RanksController < ApplicationController
  def index
    @ranks = Favorite.group('question_id').count.sort{|a,b| b[1] <=> a[1]}
    # binding.pry
  end
end
