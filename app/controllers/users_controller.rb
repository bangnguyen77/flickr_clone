class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @tagged_photos = []
    Image.all.each do |image|
      image.tags.each do |tag|
        if tag.name == @user.email
          @tagged_photos.push(image)
        end
      end
    end
  end
end
