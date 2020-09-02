class StudiesController < ApplicationController
  def index
  end

  def show
  end

  def new
    @study = current_user.created_studies.build
  end
  
  def create
    @study = current_user.created_studies.build(study_params)

    if @study.save
      redirect_to root_path, notice: "部屋を作成しました"
    else
      render :new
    end
  end

    private
  def study_params
    params.require(:study).permit(:name, :introduce, :image, :tool, :category, :end_at)
  end
end
