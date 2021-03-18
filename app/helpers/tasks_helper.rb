module TasksHelper
  def set_lists
    case params[:id]
    when 'yesterday'
      @tasks = current_user.tasks.yesterday

    when 'week'
      @tasks = current_user.tasks.per_week
    
    when 'dates'
      @tasks = current_user.tasks.list_of_dates

    else
      @tasks = current_user.tasks.today
    end
  end

  def get_progress (object)
    @time = object.time
    @goal = object.goal
    @progress = @time*100/@goal
    return @time > @goal ? (@progress-100)*(-1) : @progress
  end

  private

  def task_params
    params.require(:task).permit(:name, :time, :goal, :progress, :expiration_day, :img)
  end

end
