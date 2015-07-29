module ApplicationHelper

  # Returns the full title on a per-page basis.
  def full_title(page_title = '')
    base_title = "Do it everay day!!"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end

  # Convert the devise message to bootstrap compatible css classes
  def alert_class_for(flash_type)
    {
      :success => 'alert-success',
      :error => 'alert-danger',
      :alert => 'alert-warning',
      :notice => 'alert-info'
    }[flash_type.to_sym] || flash_type.to_s
  end
end
