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
      if @task.save
        render_success(message: 'OK')
      else
        render json: @task.errors, status: :unprocessable_entity
      end
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
