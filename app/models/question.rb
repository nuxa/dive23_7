class Question < ActiveRecord::Base
  belongs_to :user
  has_many :question_tag
  has_many :favorite
  has_many :answer
  has_many :points, class_name: 'Contribute'
end
