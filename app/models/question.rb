class Question < ActiveRecord::Base
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :answers, dependent: :destroy
  has_many :q_points, class_name: 'Contribute', foreign_key: :point_q

  validates :title,   presence: true, length: { maximum: 50 }
  validates :content, presence: true

  acts_as_taggable

end
