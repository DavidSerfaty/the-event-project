module ApplicationHelper

  def bootstrap_class_for_flash(type)
    case type
      when 'notice' then "alert-info"
      when 'success' then "alert-success"
      when 'error' then "alert-danger"
      when 'alert' then "alert-warning"
    end
  end

  def bootstrap_class_for_status(status)
    case status
      when 'accepted' then "badge-success"
      when 'pending' then "badge-warning"
      when 'refused' then "badge-danger"
    end
  end
  
end
