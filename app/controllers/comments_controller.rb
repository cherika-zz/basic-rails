class CommentsController < ApplicationController
  def create
  	@topic = Topic.find(params[:topic_id])
  	@post = Post.find(params[:post_id])
  	@comment = @post.comments.new(comments_params)
  	@comment.post = @post
  	@comment.user_id = current_user.id
  	if @comment.save
  		flash[:notice] = "Comment was saved."
  		redirect_to [@topic, @post]
  	else
  		flash[:notice] = "Comment failed to save. Try again."
  		redirect_to [@topic, @post]
  	end
  end

  def comments_params
  	params.require(:comment).permit(:body)
  end
end
