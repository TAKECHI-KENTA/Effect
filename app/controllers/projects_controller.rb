class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end
  
  def new
    @project = Project.new
  end
  
  def create
    @project = current_user.projects.new(project_params) 
    if @project.save
      flash.now[:success] = "頑張り目標を作りました"
      redirect_to projects_path
    else
      flash.now[:danger] = "タイトルと頑張る時間を入力してください"
      render :new
    end 
  end
  
  def show
  end 
  def update
  end 
  def time
  end 
  def goal
  end 
  def result
  end 
  def feedback
  end 
  
  private
    def project_params
      params.require(:project).permit(:title, :description, :duedate, :target_time, :user_id)
    end 
end
