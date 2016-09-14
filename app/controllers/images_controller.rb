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
    # binding.pry
    @image = @user.images.create(title: params[:title], url: params[:url], user_id: @user.id)
    tag_array = params[:tags].split(',')
    tag_array.each do |tag|
      @image.tags.create(name: tag)
    end

    if @image.save
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
      redirect_to images_path
    else
      render :edit
    end
  end

  def destroy
    @image = Image.find(params[:id])
    @image.destroy
    flash[:notice] = "Image successfully deleted"
    redirect_to images_path
  end

  private
  def image_params
    params.require(:image).permit(:title, :url)
  end
end
