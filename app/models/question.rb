class Question < ActiveRecord::Base
  belongs_to :user
  belongs_to :tag
  has_many :favorite
  has_many :answer
  has_many :points, class_name: 'Contribute'
  has_many :question_tag

  validates :title,   presence: true, length: { maximum: 50 }
  validates :content, presence: true

end
