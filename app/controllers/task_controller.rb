class TaskController < ApplicationController
  layout "home"
  before_action :authenticate_user!

  # Task CRUD
  def index
    @tasks = current_user.tasks.paginate(:page => params[:page], :per_page => 8)
  end

  def new
    @task = Task.new
  end

  def show
    @task = find_task_by_id
  end

  def edit
    @task = find_task_by_id
  end

  def update
    @task = find_task_by_id
    if @task
      flash[:success] = "Task edited"
      @task.update(task_params(:name,:description,:deadline,:status))
    else
      flash[:error] = "Task not found"
    end
    redirect_to(request.env['HTTP_REFERER'])
  end

  def create
    flash[:success] = "Task created"
    @task = current_user.tasks.create(task_params(:name,:description,:deadline,:status).merge(status: 1))
    @task.save
    redirect_to task_index_path
  end

  def destroy
    task  = find_task_by_id
    if task
      task.destroy
      flash[:success] = "Task deleted"
    else
      flash[:error] = "Task not found"
    end
    redirect_to(request.env['HTTP_REFERER'])
  end

  # Share task other user

  def share
    @task = find_task_by_id
  end

  def share_user
    user = User.find_user_by_username_or_email(share_params(:user)[:user])
    if user
      if current_user.id != user.id
        share_task = UserTask.new
        share_task.sharer_id = current_user.id
        share_task.user_id = user.id
        share_task.task_id = params[:id]
        share_task.share_type = params[:anything][:type]
        if share_task.save
          flash[:success] = "Task shared"
        else
          flash[:error] = "Task can not share"
        end
      else
        flash[:error] = "Can not share task yourself"
      end
    else
      flash[:error] = "User not found"
    end

    redirect_to(request.env['HTTP_REFERER'])
  end

  private

  def find_task_by_id
    current_user.tasks.find(params[:id])
  end
  def task_params(*args)
    params.require(:task).permit(*args)
  end

  def share_params(*args)
    params.require(:anything).permit(*args)
  end
end
