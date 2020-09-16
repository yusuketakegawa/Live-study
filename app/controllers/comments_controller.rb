class CommentsController < ApplicationController
  
  def create
    @comment = Comment.create(comment_params)
    respond_to do |format|
      format.html {redirect_to "/studies/#{comment.study.id}"}
      format.json
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, study_id: params[:study_id])
  end
end
