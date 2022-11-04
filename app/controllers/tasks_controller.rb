class TasksController < ApplicationController
  
  
  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to time_path, success: '登録しました。取り消したいときは同じマイナスの数値を入力してください'
    else
      flash[:danger] = "数値を入力して下さい。それでもうまくいかない場合一度ログアウトしてください"
      redirect_to time_path
    end 
  end
  
  private
    def task_params
      params.require(:task).permit(:hour, :project_id)
    end 
end
