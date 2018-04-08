class TagsController < ApplicationController

  def index
    @tags = Picture.tag_counts_on(:tags).order('count DESC')
  end

end
