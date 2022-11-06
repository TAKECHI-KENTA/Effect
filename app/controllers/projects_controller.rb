class ProjectsController < ApplicationController
  
  def index
    #目標ごとのカード
    @ongoing_projects = current_user.projects.where(status: nil)
    
    # 数値集計 1) 全プロジェクトのタスク時間
    all_tasks = Task.all
    @all_projects_time = all_tasks.sum(:hour).round(1)  
    
    # 数値集計 2) 未完了プロジェクトのタスク時間
    ongoing_tasks = Task.where(project_id: @ongoing_projects.ids) 
    @ongoing_projects_time = ongoing_tasks.sum(:hour).round(1)  
    
    # 数値集計 3) 完了プロジェクトのactual_time / target_time
    done_projects = current_user.projects.where(status: 'done')
    actual = done_projects.sum(:actual_time)
    target = done_projects.sum(:target_time)
    @done_projects_time_ratio = ((actual / target)*100).round(0)
    
    
  end
  
  def new
    @project = Project.new
  end
  
  def create
    @project = current_user.projects.new(project_params) 
    if @project.save!
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
    @ongoing_projects = current_user.projects.where(status: nil)
    @task = Task.new
  end 
  
  def update
    # /projects/goal, /result のviewから受け取った内容でプロジェクトを修正。
    current_project = current_user.projects.find(project_params[:id])
    current_project.update(project_params)
    redirect_to projects_index_path, success: '修正しました。'
  end 
  
  def goal
    # 修正前のプロジェクトを表示
    @project = Project.find_by(id: params[:project_id])
  end 
  
  def result
    @ongoing_projects = current_user.projects.where(status: nil)
    if params[:project_id].present?
      @selected_project = @ongoing_projects.find(params[:project_id])
    end 
  end
  
  def feedback
  end 
  
  
  
  private
    def project_params
      params.require(:project).permit(:title, :description, :duedate, :target_time, :id, :level_of_achievement, :comment, :status, :actual_time)
    end 
end
