module ApplicationHelper
  def display_stop(stop)
    if stop.city == stop.state
      return "#{stop.city}, #{stop.country}"
    elsif stop.country == "United States"
      return "#{stop.city}, #{stop.state}"
    else
      return "#{stop.city}, #{stop.country}"
    end
  end
end
