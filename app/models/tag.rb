class Tag < ActiveRecord::Base
  has_many :question_tag
  has_many :questions, through: :question_tag

  validates :name,
    presence: true,
    length: { maximum: 50 }
end
