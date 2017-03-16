class Question < ActiveRecord::Base
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :answers
  has_many :points, class_name: 'Contribute'
  has_many :question_tag
  has_many :tags, through: :question_tag

  validates :title,   presence: true, length: { maximum: 50 }
  validates :content, presence: true

end
