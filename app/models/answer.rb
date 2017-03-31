class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :user
  has_many :a_points, class_name: 'Contribute', foreign_key: :point_a

  validates :content, presence: true
end
