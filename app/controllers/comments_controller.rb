class CommentsController < ApplicationController

  # POST /comments
  # POST /comments.json
  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.topic = Topic.find(comment_params[:topic_id])

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @comment.topic, notice: 'Comment was successfully created.' }
      else
        format.html { redirect_to @comment.topic }
      end
    end
  end

  private

    def comment_params
      params.require(:comment).permit(:message, :user, :topic_id)
    end

end
