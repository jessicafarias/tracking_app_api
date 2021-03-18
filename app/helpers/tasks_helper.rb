module TasksHelper
  def set_lists
    @tasks = case params[:id]
             when 'yesterday'
               current_user.tasks.yesterday

             when 'week'
               current_user.tasks.per_week

             when 'dates'
               current_user.tasks.list_of_dates

             else
               current_user.tasks.today
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
    params.require(:task).permit(:name, :time, :goal, :progress, :expiration_day, :img)
  end
end
