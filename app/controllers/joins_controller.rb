class JoinsController < ApplicationController

  def new
  end

  def create
    study = Study.find(params[:study_id])
    @join = current_user.joins.build do |t|
      t.study = study
    end

    if @join.save
      redirect_to study, notice: "参加しました"
    end
  end
end
