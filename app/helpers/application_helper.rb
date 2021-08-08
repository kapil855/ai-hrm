module ApplicationHelper

  # display bootstrap alert messages
  def flash_class(level)
    case level
      when :success then "alert alert-success"
      when :notice then "alert alert-success"
      when :alert then "alert alert-danger"
      when :error then "alert alert-danger"
      when :warning then "alert alert-warning"
    end
  end

  # count the duration of logged in session of a user 
  def total_session_duration(in_time, out_time)
    seconds_diff = (in_time - out_time).to_i.abs

    hours = seconds_diff / 3600
    seconds_diff -= hours * 3600

    minutes = seconds_diff / 60
    seconds_diff -= minutes * 60

    seconds = seconds_diff

    # "#{hours.to_s.rjust(2, '0')}:#{minutes.to_s.rjust(2, '0')}:#{seconds.to_s.rjust(2, '0')}"
    "#{hours.to_s.rjust(2, '0')}:#{minutes.to_s.rjust(2, '0')}"
  end

  def show_in_time(in_time)
    in_time.strftime("%H:%M:%S %p")
  end

  def show_out_time(out_time)
    out_time.strftime("%H:%M:%S %p")
  end
end
