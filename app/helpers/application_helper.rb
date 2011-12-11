module ApplicationHelper
  def check_for_errors(object)
    render(:partial => 'shared/form_errors', :locals => { :object => object }) if object.errors.any?
  end
  
  
  def pretty_date(date, options = {})
    time_format = date.strftime("%l:%M%p").downcase
    if options[:short]
      pretty_date = date.strftime("%D")
      pretty_date += " - " unless !options[:time]
    elsif options[:only_time]
      return time_format
    else
      pretty_date = date.strftime("%A, %B ") + date.strftime("%e").to_i.ordinalize + ", " + date.strftime("%Y")
      pretty_date += " at " unless !options[:time]
    end
    pretty_date += time_format unless !options[:time]
    return pretty_date
  end
end
