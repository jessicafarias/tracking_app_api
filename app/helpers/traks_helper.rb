module TracksHelper
  def track_params
    params.permit(:time, :goal)
  end
end