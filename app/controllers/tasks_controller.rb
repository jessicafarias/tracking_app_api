class TasksController < ApplicationController
  include TasksHelper
  before_action :authenticate_and_set_user
  before_action :authenticate_and_set_user_or_admin
  skip_before_action :verify_authenticity_token, only: [:create]

  def index
    @tasks = current_user.tasks
    render json: @tasks
  end

  def show
    set_lists
    render json: @tasks
  end

  def create
    @task = current_user.tasks.new(task_params)
    @task.expiration_day = DateTime.now
    if @task.save
      @progress = get_progress @task
      @task.progress = @progress.to_i
      @task.save
      render_success(message: 'OK')
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  def update
    @task = Task.find(params[:id])
    @task.expiration_day = DateTime.now
    if @task.save
      @task.progress = get_progress(@task).save
      render_success(message: 'Task updated!')
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
  end
end
