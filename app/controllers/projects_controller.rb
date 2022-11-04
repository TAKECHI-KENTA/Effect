class ProjectsController < ApplicationController
  
  def index
    @projects = current_user.projects.all
  end
  
  def new
    @project = Project.new
  end
  
  def create
    @project = current_user.projects.new(new_project_params) 
    if @project.save
      flash.now[:success] = "頑張り目標を作りました"
      redirect_to projects_path
    else
      flash.now[:danger] = "タイトルと頑張る時間を入力してください"
      render :new
    end 
  end
  
  def show
    @project = current_user.projects.find(params[:id])
    # これまでの合計時間と最終更新時点
    project_task = Task.where(project_id: params[:id])
    @project_time = project_task.sum(:hour).round(1)          #合計時間(小数点第一まで)
    @project_last_update = project_task.maximum(:created_at)  #最終更新
    # 時間達成率
    ratio = (@project_time / @project.target_time) * 100
    @project_achievement_ratio = ratio.round(2)
  end 
  
  def time
    @projects = current_user.projects.all
    @task = Task.new
  end 
  
  def update
    # projects/goalのviewから受け取った内容でプロジェクトを修正
    current_project = current_user.projects.find(new_project_params[:id])
    project_revised = current_project.update(new_project_params)
    redirect_to projects_index_path, success: '修正しました。'
  end 
  
  def goal
    # 修正前のプロジェクトを表示する
    @project = Project.find_by(id: params[:project_id])
    
  end 
  
  def result
  end 
  def feedback
  end 
  
  
  
  private
    def new_project_params
      params.require(:project).permit(:title, :description, :duedate, :target_time, :id)
    end 
end
