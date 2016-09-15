class ImagesController < ApplicationController
  def index
    @images = Image.all
  #  binding.pry
  end

  def new
    @image = Image.new
  end

  def create
    @user = current_user
    @image = @user.images.create(title: params[:title], url: params[:url], user_id: @user.id)
    tag_array = params[:tags].split(',')
    tag_array.each do |tag|
      clean_tag = tag.strip
      @image.tags.create(name: clean_tag)
    end
    if @image.save
      flash[:notice] = "Image successfully added!"
      redirect_to images_path
    else
      render :new
    end
  end

  def edit
    @image = Image.find(params[:id])

  end

  def update
    @image = Image.find(params[:id])
    if @image.update(image_params)
      flash[:notice] = "Image successfully updated!"
      redirect_to images_path
    else
      flash[:alert] = "Image did not update!"
      render :edit
    end
  end

  def destroy
    @image = Image.find(params[:id])
    @image.destroy
    flash[:notice] = "Image successfully deleted"
    redirect_to images_path
  end

  def show
    @image = Image.find(params[:id])
  end

  private
  def image_params
    params.require(:image).permit(:title, :url)
  end
end
