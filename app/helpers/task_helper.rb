module TaskHelper
  def flash_class(level)
    case level
      when :notice then "info"
      when :success then "success"
      when :error then "negative"
      when :alert then "warning"
    end
  end

  def convert_status_text_to_number(status)
    if status
      1
    else
      0
    end
  end
end
