class TasksController < ApplicationController
  include TasksHelper
  before_action :authenticate_and_set_user
  before_action :authenticate_and_set_user_or_admin
  skip_before_action :verify_authenticity_token, only: [:create]

  def index
    @tasks = current_user.tasks.with_track
    render json: @tasks
  end

  def show
    set_lists
    render json: @tasks.with_track
  end

  def create
    @task = current_user.tasks.new(task_params)

    if @task.save
      @days = (@task.expiration_day - Date.today).to_i
      create_tracks(@task)
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

  def create_tracks(base_task)
    @days = (base_task.expiration_day - Date.today).to_i
    @days = 1 if @days <= 0
    @days.times do |x|
      @current_track = @task.tracks.new(track_params)
      @current_track.day = Date.today + x
      @progress = get_progress @current_track
      @current_track.progress = @progress.to_i
      @current_track.save
    end
  end
end
