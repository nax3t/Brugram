class PhotosController < ApplicationController
  before_action :set_user
  before_action :find_photo, except: [:index, :new, :create]
  
  def index
    @photos = @user.photos

    @public_photos = Photo.all
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
    params.require(:photo).permit(:title, :url, :body, :public)
  end

  def find_photo
    @photo = Photo.find(params[:id])
    if @photo.public || @photo.user == @user
      render 'show'
    else
      flash[:notice] = 'That photo is private!'
      redirect_to photos_path
    end
  end

  def set_user
    @user = current_user
  end

end
