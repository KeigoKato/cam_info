class TagsController < ApplicationController

  def index
    @tags = Picture.tag_counts_on(:tags).order('count DESC')
    @pictures = Picture.tagged_with(params[:tag_name]).includes(:tags)
  end

  def show
    @picture = Picture.tagged_with(params[:tag_name])
  end

end
