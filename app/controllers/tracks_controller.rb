class TracksController < ApplicationController
  before_action :authenticate_and_set_user
  before_action :authenticate_and_set_user_or_admin

  def show
    @track = Track.find(params[:id])
    if @track
      render json: @track
    else
      render json: @track.errors, status: :unprocessable_entity
    end
  end

  def update
    @track = Track.find(params[:id])
    @number = @track.time
    @track.time = @number + 1
    if @track.save
      render_success(message: 'Track updated!')
    else
      render json: @track.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @track = Track.find(params[:id])
    if @track.destroy
      render_success(message: 'Track deleted!')
    else
      render json: @track.errors, status: :unprocessable_entity
    end
  end
end
