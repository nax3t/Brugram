class CommentsController < ApplicationController
  
  before_action :set_user

  def index
  end

  def new
  end

  def create
    @photo = Photo.find(params[:photo_id])
    @comment = Comment.new(comment_params)
    @comment.photo = @photo
    @comment.user = @user
    if @comment.save
      redirect_to @photo
    else
      render @photo
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  
  def set_user
    @user = current_user
  end

  def comment_params
    params.require(:comment).permit(:body)
  end

end
