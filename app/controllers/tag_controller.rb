class TagController < ApplicationController
  def index
    @tags = []
    tags = Question.tags_on(:tags);
    for tag in tags do
      @tags.push(tag.name)
    end
  end
end
