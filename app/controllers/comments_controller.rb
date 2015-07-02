class CommentsController < ApplicationController
  
  before_action :set_user

  def new
  end

  def create
    @photo = Photo.find(params[:photo_id])
    @comment = @photo.comments.build(comment_params)
    @comment.user = @user
    if @comment.save
      redirect_to @photo
    else
      render @photo
    end
  end

  private
  
  def set_user
    @user = current_user
  end

  def comment_params
    params.require(:comment).permit(:body)
  end

end
