class TagsController < ApplicationController
  def index

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

  private
  def tag_params
    params.require(:tag).permit(:name)
  end
end
