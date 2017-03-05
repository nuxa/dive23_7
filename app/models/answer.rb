class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :user
  has_many :points, class_name: 'Contribute'

  validates :content, presence: true
end
