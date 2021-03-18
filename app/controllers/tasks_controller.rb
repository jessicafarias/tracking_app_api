class TasksController < ApplicationController
  before_action :authenticate_and_set_user
  before_action :authenticate_and_set_user_or_admin
  skip_before_action :verify_authenticity_token, only: [:create]

  def index
    @tasks = current_user.tasks
    render json: @tasks
  end

  def create
    @task = current_user.tasks.new(task_params)
    @progress= get_progress (@task)
    @task.progress = @progress.to_i
    @task.expiration_day = DateTime.now
      if @task.save
        render_success(message: 'OK')
      else
        render json: @task.errors, status: :unprocessable_entity
      end
  end

  def update
    @task = Task.find(params[:id])
    @task.progress= get_progress(@task)
    @task.expiration_day = DateTime.now
      if @task.save
        render_success(message: 'Task updated!')
      else
        render json: @task.errors, status: :unprocessable_entity
      end
  end

  #User.first.tasks.where(expiration_day: Date.today)
  #Date.today-1
  #scope :range, ->() { where("created_at < ? AND "created_at >?, Date.today-7, Date.today)}

  def get_progress (object)
    @time = object.time
    @goal = object.goal
    @progress = @time*100/@goal
    return @time > @goal ? (@progress-100)*(-1) : @progress
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
  end

  private

  def task_params
    params.require(:task).permit(:name, :time, :goal, :progress, :expiration_day, :img)
  end
end
