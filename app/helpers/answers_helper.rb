module AnswersHelper
  def getContributeA(answer)
    contributeA = Contribute.find_by(user_id: current_user.id, point_a: answer.id)
    if !contributeA
      contributeA = answer.a_points.build
    end
    contributeA
  end
end
