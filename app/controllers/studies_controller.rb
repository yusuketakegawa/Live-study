class StudiesController < ApplicationController
  def index
    @studies = Study.all
  end

  def show
    @study = Study.find(params[:id])
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

  def edit
    @study = current_user.created_studies.find(params[:id])
  end

  def update
    @study = current_user.created_studies.find(params[:id])
    if @study.update(study_params)
      redirect_to @study, notice: '更新しました'
    end
  end

  def destroy
    @study = current_user.created_studies.find(params[:id])
    @study.destroy!
    redirect_to root_path, notice: "削除しました"
  end
    private
  def study_params
    params.require(:study).permit(:name, :introduce, :image, :tool_id, :category_id, :end_at)
  end
end
