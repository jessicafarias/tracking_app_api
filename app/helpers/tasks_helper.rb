module TasksHelper
  def set_lists
    @tasks = case params[:id]
             when 'yesterday'
               current_user.tasks.yesterday.with_track

             when 'week'
               current_user.tasks.per_week.with_track

             when 'dates'
               current_user.tasks.list_of_dates.with_track

             else
               current_user.tasks.today.with_track
             end
  end

  def get_progress(object)
    @time = object.time
    @goal = object.goal
    @progress = @time * 100 / @goal
    @time > @goal ? (@progress - 100) * -1 : @progress
  end

  private

  def task_params
    params.require(:task).permit(:name, :progress, :expiration_day, :img)
  end
end
