class StudiesController < ApplicationController
  def index
  end

  def show
  end

  def new
    @study = Study.new
    @study.users << current_user
  end
  
  def create
    @study = Study.new(study_params)
    if @study.save
      redirect_to root_path
    end
  end
end
