class Tag < ActiveRecord::Base
  has_many :question_tag

  validates :name,
    presence: true,
    length: { maximum: 50 }
end
