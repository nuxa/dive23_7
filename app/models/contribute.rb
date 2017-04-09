class Contribute < ActiveRecord::Base
  belongs_to :user
  belongs_to :question, foreign_key: :point_q
  belongs_to :answer, foreign_key: :point_a
end
