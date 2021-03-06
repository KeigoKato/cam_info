class PicturesController < ApplicationController
  before_action :set_picture, only: [:show, :edit, :update, :destroy]
  before_action :set_picture_tags_to_gon, only: :edit
  before_action :set_available_picture_tags_to_gon
  before_action :authenticate_user!

  # GET /pictures
  # GET /pictures.json
  def index
    @pictures = Picture.includes(:tags).order("created_at DESC")
    # @likes_count = Like.where(picture_id: @pictures.id).count
  end

  # GET /pictures/1
  # GET /pictures/1.json
  def show
    @picture = Picture.find(params[:id])
    @exif = @picture.exif
    @tags = @picture.tag_counts_on(:tags).order('taggings_count DESC')
  end

  # GET /pictures/new
  def new
    @picture = Picture.new
  end

  # GET /pictures/1/edit
  def edit
  end

  # POST /pictures
  # POST /pictures.json
  def create
    @picture = Picture.new(picture_params)
    if @picture.save
      exifData = @picture.get_exif_data.merge(picture_id: @picture.id)
      exif = Exif.create(exifData)
      redirect_to "/pictures/#{@picture.id}/exifs/#{@picture.exif.id}/edit", sucesess: "画像が保存されました　exif情報を追加してください"
    else
      redirect_to new_picture_path, warning: "画像を選択してください"
    end
  end

  # PATCH/PUT /pictures/1
  # PATCH/PUT /pictures/1.json
  def update
    respond_to do |format|
      if @picture.update(picture_params)
        format.html { redirect_to @picture, notice: 'exif情報を変更・追加・削除をしてください' }
        format.json { render :show, status: :ok, location: @picture }
      else
        format.html { render :edit }
        format.json { render json: @picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pictures/1
  # DELETE /pictures/1.json
  def destroy
    @picture.destroy
    respond_to do |format|
      format.html { redirect_to pictures_url, notice: 'Picture was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_picture
      @picture = Picture.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def picture_params
      params.require(:picture).permit(:image, :tag_list)
    end

    def set_picture_tags_to_gon
      gon.picture_tags = @picture.tag_list
    end

    def set_available_picture_tags_to_gon
      gon.available_tags = Picture.tags_on(:tags).pluck(:name)
    end

end
