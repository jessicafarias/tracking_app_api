module TasksHelper
  def set_lists
    @tasks = case params[:id]
             when 'today'
               current_user.tasks.today.with_track
             when 'yesterday'
               current_user.tasks.yesterday.with_track

             when 'week'
               current_user.tasks.per_week.with_track

             when 'dates'
               current_user.tasks.joins(:tracks).list_of_dates

             when ''
               current_user.tasks.with_track
             else
               current_user.tasks.date(params[:id]).with_track
             end
  end

  def get_progress(object)
    @time = object.time
    @goal = object.goal
    @progress = @time * 100 / @goal
    @time > @goal ? (@progress - 100) * -1 : @progress
  end

  def create_tracks(base_task)
    @days = (base_task.expiration_day - Date.today).to_i + 1
    @days = 1 if @days <= 1
    @days.times do |x|
      @current_track = @task.tracks.new(track_params)
      @current_track.day = Date.today + x
      @progress = get_progress @current_track
      @current_track.progress = @progress.to_i
      @current_track.save
    end
  end

  private

  def task_params
    params.require(:task).permit(:name, :progress, :expiration_day, :img)
  end
end
