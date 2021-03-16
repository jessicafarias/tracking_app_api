class TasksController < ApplicationController
  before_action :authenticate_and_set_user,only: [:index]
  def index
    @tasks = User.find(@current_user.id).tasks
    render json: @tasks
  end

  def create
    @task = User.first.tasks.new(task_params)
    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: 'User1 was successfully created.' }
        render json: @task, status: :created, location: @task
      else
        format.html { render :new }
        render json: @task.errors, status: :unprocessable_entity
      end
    end
  end
#

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
  end


  private

  def task_params
    params.permit(:name, :img, :goal, :time)
  end
end
