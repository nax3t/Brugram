class PhotosController < ApplicationController
  before_action :set_user
  before_action :find_photo, except: [:index, :new, :create]
  
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
  end

  def edit
  end

  def update
    if @photo.update(photo_params)
      redirect_to @photo
    else
      render 'edit'
    end
  end

  def destroy
    @photo.destroy
    redirect_to photos_path
  end

  private

  def photo_params
    params.require(:photo).permit(:title, :url, :body)
  end

  def find_photo
    @photo = @user.photos.find(params[:id])
  end

  def set_user
    @user = current_user
  end

end
