class StudiesController < ApplicationController
  def index
    @studies = Study.without_deleted.order(created_at: "DESC").page(params[:page]).per(12)
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
    # @ready = Study.find_by(owner_id:current_user.id, deleted_at: nil)
    # if !@ready.nil?
    #   redirect_to root_path, notice: "新しい部屋を作るには現在の部屋を終了してください"
    # else
    #   @study = current_user.created_studies.build
    # end

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
      @search = Study.ransack(params[:q])
      @search_studies = @search.result(distinct: true).without_deleted.order(created_at: "DESC").page(params[:page]).per(12)
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



end
