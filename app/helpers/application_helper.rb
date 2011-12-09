module ApplicationHelper
  def check_for_errors(object)
    render(:partial => 'shared/form_errors', :locals => { :object => object }) if object.errors.any?
  end
end
