class TasksController < ApplicationController
  before_action :authenticate_and_set_user
  def index
    @tasks = User.find(@current_user.id).tasks
    render json: @tasks
  end

  def create
    @task = Task.new(task_params)
    if @task.save
        render json: @task, status: :created, location: @task
    else
        render json: @task.errors, status: :unprocessable_entity
    end
  end
#

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
  end


  private

  def task_params
    params.require(:task).permit(:name, :goal, :expiration_day, :user_id)
  end
end
