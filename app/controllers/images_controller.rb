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
    @image = @user.images.new(image_params)
    if @image.save
      redirect_to images_path
    else
      render :new
    end
  end

  private
  def image_params
    params.require(:image).permit(:title, :url)
  end
end
