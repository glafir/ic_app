module ApplicationHelper

  # Return a title on a per-page basis.
  def title
    base_title = "Information Centre."
    if @title.nil?
      base_title
    else
      "#{@title} | #{base_title}"
    end
  end
  
  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = column == sort_column ? "current #{sort_direction}" : nil
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, {:sort => column, :direction => direction}, {:class => css_class}
  end
end