class StudiesController < ApplicationController
  before_action :move_to_index, except: [:index]
  before_action :set_study, only: %i[edit update destroy finish]

  def index
    @studies = Study.without_deleted.order(created_at: "DESC").page(params[:page]).per(12)
    @search = Study.ransack(params[:q])
    @search_studies = @search.result(distinct: true).recent
  end

  def show
    @study = Study.find(params[:id])
    @join = current_user&.joins&.find_by(study: @study)
    @joins = @study.joins.includes(:user).order(:created_at)
    @comment = Comment.new
    @comments = @study.comments.includes(:user)
  end

  def new
    # 論理削除されている部屋以外にテーブルにレコードが存在していた場合新しい部屋は作れない
    @already = Study.find_by(owner_id: current_user.id, deleted_at: nil)
    if !@already.nil?
      redirect_to studies_path, notice: "新しい部屋を作るには現在の部屋を終了/削除してください"
    else
      @study = current_user.created_studies.build
    end

    @study = current_user.created_studies.build
  end

  def create
    @study = current_user.created_studies.build(study_params)

    if @study.save
      @study.create_notification_study!(current_user, @study.id)
      redirect_to studies_path, notice: "部屋を作成しました"
    else
      render :new
    end
  end

  def search
    @search = Study.ransack(params[:q])
    @search_studies = @search.result(distinct: true).without_deleted.order(created_at: "DESC").page(params[:page]).per(12)
  end

  def edit; end

  def update
    redirect_to @study, notice: "更新しました" if @study.update!(study_params)
  end

  def destroy
    @study.really_destroy!
    redirect_to studies_path, notice: "部屋を削除しました"
  end

  def finish
    @study.destroy!
    redirect_to studies_path, notice: "部屋を終了しました"
  end

  private

  def study_params
    params.require(:study).permit(:name, :introduce, :image, :tool_id, :category_id, :end_at, :url)
  end

  def move_to_index
    redirect_to studies_path, notice: "アカウント登録もしくはログインしてください" unless user_signed_in?
  end

  def set_study
    @study = current_user.created_studies.find(params[:id])
  end
end
