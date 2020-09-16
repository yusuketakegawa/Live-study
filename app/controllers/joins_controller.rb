class JoinsController < ApplicationController
  
  def create
    @ready = Join.find_by(user_id:current_user.id, deleted_at: nil)
    if !@ready.nil?
      redirect_to root_path, notice: "一度に複数の部屋には入れません"
      return
    else
    end
    study = Study.find(params[:study_id])
    @join = current_user.joins.build do |t|
      t.study = study
    end

    if @join.save
      redirect_to study, notice: "参加しました"
      return
    else

    end
  end

  def destroy
    join = current_user.joins.find_by!(study_id: params[:study_id])
    join.really_destroy!
    redirect_to study_path(params[:study_id]), notice: "退出しました"
  end
end
