class TracksController < ApplicationController
  skip_before_action :verify_authenticity_token

  def show
    @track = Track.find(params[:id])
    render json: @track
  end

  def update
    @track = Track.find(params[:id])
    @track.time = @track.time +1
    if @track.save
      render_success(message: 'Track updated!')
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @track = Track.find(params[:id])
    @task.destroy
  end
end
