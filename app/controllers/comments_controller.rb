class CommentsController < ApplicationController

  def index
  	@user = User.find(current_user.id)
  	@booknew = Book.new
  	@book = Book.find(params[:book_id])
  	@commentnew = Comment.new
    @comments = Comment.all
    @users = User.all

  end

  def create
  	@commentnew = Comment.new(comment_params)
  	@commentnew.book_id = current_user.id
    @commentnew.user_id = current_user.id
  	@commentnew.save
  	redirect_to book_comments_path(@commentnew)
  	
  end

  private
  def comment_params
  	params.require(:comment).permit(:comment, :use_id, :book_id)
  end

end
