class StudiesController < ApplicationController
  def index
    @studies = Study.all
    @search = Study.ransack(params[:q])
    @search_studies = @search.result(distinct: true).order(created_at: "DESC")
  end

  def show
    @study = Study.find(params[:id])
    @join = current_user && current_user.joins.find_by(study: @study)
    @joins = @study.joins.includes(:user).order(:created_at)
    @comment = Comment.new
    @comments = @study.comments.includes(:user)
  end


  def new
    @study = current_user.created_studies.build
  end
  
  def create
    @study = current_user.created_studies.build(study_params)

    if @study.save
      @study.create_notification_study!(current_user, @study.id)
      redirect_to root_path, notice: "部屋を作成しました"
    else
      render :new
    end
  end

  def search
    if params[:q].present?
      @search = Study.ransack(search_params)
      @search_studies = @search.result(distinct: true).order(created_at: "DESC")
    else
      params[:q] = { sorts: 'id desc'}
      @study = Study.ransack()
      @search_studies = Study.all
    end
  end

  def edit
    @study = current_user.created_studies.find(params[:id])
  end

  def update
    @study = current_user.created_studies.find(params[:id])
    if @study.update!(study_params)
      redirect_to @study, notice: "更新しました"
    end
  end

  def destroy
    @study = current_user.created_studies.find(params[:id])
    @study.really_destroy!
    redirect_to root_path, notice: "部屋を削除しました"
  end

  def finish
    @study = current_user.created_studies.find(params[:id])
    @study.destroy!
    redirect_to root_path, notice: "部屋を終了しました"
  end


    private

  def study_params
    params.require(:study).permit(:name, :introduce, :image, :tool_id, :category_id, :end_at, :url)
  end

  def search_params
    params.require(:q).permit(:sorts)
  end

end
