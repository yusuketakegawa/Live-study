class CommentsController < ApplicationController
   def create
    comment = Comment.create(comment_params)
    redirect_to "/studies/#{comment.study.id}"
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, study_id: params[:study_id])
  end
end
