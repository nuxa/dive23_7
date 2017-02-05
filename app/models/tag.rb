class Tag < ActiveRecord::Base
  has_many :question_tag
end
