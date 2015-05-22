class CommentsController < ApplicationController
  before_filter  :authenticate_user!
  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)
    @comment.post = @post
    @comment.user = current_user
    respond_to do |format|
      if @comment.save
        format.html  { redirect_to @post, notice: 'Comment was successfully created.' }
        format.js
      else
        format.html  { redirect_to @post, notice: "Error:#{@comment.errors}"  }
        format.js
      end
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to @post, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end