class CommentsController < ApplicationController
  def create
  	# @topic = Topic.find(params[:topic_id])
  	@post = Post.find(params[:post_id])
  	@comment = @post.comments.build(comments_params)
  	# @comment.post = @post
  	@comment.user = current_user
  	if @comment.save
  		flash[:notice] = "Comment was saved."
  		redirect_to [@post.topic, @post]
  	else
  		flash[:notice] = "Comment failed to save. Try again."
  		redirect_to [@post.topic, @post]
  	end
  end

  def destroy
    # @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])

    authorize @comment
     if @comment.destroy
       flash[:notice] = "Comment was removed."
     else
       flash[:error] = "Comment couldn't be deleted. Try again."
     end

     respond_to do |format|
      format.html
      format.js
    end
  end

  def comments_params
  	params.require(:comment).permit(:body)
  end
end
