class CommentsController < ApplicationController

  def index
  	@user = User.find(current_user.id)
  	@booknew = Book.new
  	@book = Book.find(params[:book_id])
  	@commentnew = Comment.new
    @comments = @book.comments
  end

  def create
    book = Book.find(params[:book_id])
  	@commentnew = Comment.new(comment_params)
  	@commentnew.user_id = current_user.id
    @commentnew.book_id = book.id
  	@commentnew.save
  	redirect_to book_comments_path(book)
  end

  def edit
    @book = Book.find(params[:book_id])
    @comment = Comment.find(params[:id])
    if @comment.user_id == current_user.id
      render action: :edit
    else
      redirect_to books_path
    end
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
       flash[:comment] = 'You have comment updated user successfully.'
       redirect_to book_comments_path(params[:book_id])
    else
       @book = Book.find(params[:book_id])
       render 'edit'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to book_comments_path(params[:book_id])
  end

  private
  def comment_params
  	params.require(:comment).permit(:comment)
  end

end
