class TasksController < ApplicationController
  def index
    @tasks = Task.all
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


  def destroy
    @task = Book.find(params[:id])
    @task.destroy
  end


  private

  def task_params
    params.require(:task).permit(:name, :goal, :expiration_day, :user_id)
  end
end
