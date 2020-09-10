class JoinsController < ApplicationController

  def create
    study = Study.find(params[:study_id])
    @join = current_user.joins.build do |t|
      t.study = study
    end

    if @join.save
      redirect_to study, notice: "参加しました"
    else
      redirect_to root_path, notice: "一度に複数の部屋には入れません"
    end
  end

  def destroy
    join = current_user.joins.find_by!(study_id: params[:study_id])
    join.destroy!
    redirect_to study_path(params[:study_id]), notice: "退出しました"
  end
end
