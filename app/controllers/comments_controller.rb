class CommentsController < ApplicationController
  def create
  	@topic = Topic.find(params[:topic_id])
  	@post = Post.find(params[:post_id])
  	@comment = @post.comments.build(comments_params)
  	# @comment.post = @post
  	@comment.user = current_user
  	if @comment.save
  		flash[:notice] = "Comment was saved."
  		redirect_to [@topic, @post]
  	else
  		flash[:notice] = "Comment failed to save. Try again."
  		redirect_to [@topic, @post]
  	end
  end

  def destroy
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.find(params[:post_id])
    @comment = @post.comments.find(params[:id])

    authorize @comment
     if @comment.destroy
       flash[:notice] = "Comment was removed."
       redirect_to [@topic, @post]
     else
       flash[:error] = "Comment couldn't be deleted. Try again."
       redirect_to [@topic, @post]
     end
  end

  def comments_params
  	params.require(:comment).permit(:body)
  end
end
