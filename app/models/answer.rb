class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :user
  has_many :points, class_name: 'Contribute', dependent: :destroy

  validates :content, presence: true
end
