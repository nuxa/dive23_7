class Question < ActiveRecord::Base
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :answers
  has_many :points, class_name: 'Contribute'

  validates :title,   presence: true, length: { maximum: 50 }
  validates :content, presence: true

  acts_as_taggable

end
