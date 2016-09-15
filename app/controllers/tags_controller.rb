class TagsController < ApplicationController
  def index
    # binding.pry
    @tag = Tag.find(params[:id])
  end

  def new
    @users = User.all
    @image = Image.find(params[:image_id])
    @tag = @image.tags.new
  end

  def create
    @image = Image.find(params[:image_id])
    @tag = @image.tags.new
    if tag_params[:name] != ""
      new_tag = Tag.find_or_create_by(tag_params)
      if @image.tags.include?(new_tag)
        flash[:notice] = "Image already has that tag"
        redirect_to new_image_tag_path(@image, @tag)
      else
        @image.tags.push(new_tag)
        flash[:notice] = "Tag successfully added!"
        redirect_to images_path
      end
    else
      flash[:alert] = "Tag name cannot be blank"
      redirect_to new_image_tag_path(@image, @tag)
    end

  end

  def edit
    @image = Image.find(params[:image_id])
    @tag = Tag.find(params[:id])
  end

  def update
    @image = Image.find(params[:image_id])
    @tag = Tag.find(params[:id])
    if @tag.update(tag_params)
      flash[:notice] = "Tag successfully updated!"
      redirect_to image_path(@image)
    else
      flash[:alert] = "Tag did not update!"
      render :edit
    end
  end

  def destroy
    @image = Image.find(params[:image_id])
    @tag = Tag.find(params[:id])
    @tag.destroy
    flash[:notice] = "Tag successfully deleted"
    redirect_to image_path(@image)
  end

  private
  def tag_params
    params.require(:tag).permit(:name)
  end
end
