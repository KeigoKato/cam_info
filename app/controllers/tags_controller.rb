class TagsController < ApplicationController

  def index
    @tags = Picture.tag_counts_on(:tags).order('count DESC')
    respond_to do |format|
      format.html
      format.js
    end
  end

  def search
    @pictures = Picture.tagged_with(params[:tag_name]).includes(:tags)
  end


end
