class PhotosController < ApplicationController
  before_action :set_user

  def index
    @photos = @user.photos
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
    @photo.user = @user
    if @photo.save
      redirect_to @photo
    else
      render 'new'
    end
  end

  def show
    @photo = @user.photos.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def photo_params
    params.require(:photo).permit(:title, :url, :body)
  end

  def set_user
    @user = current_user
  end

end
