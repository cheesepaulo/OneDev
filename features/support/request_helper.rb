module RequestHelper
  def wait_for_ajax(seconds: 0.5)
    loop do
      sleep seconds
      break if finished_all_ajax_requests? && finished_all_vue_resource_requests?
    end
  end


  private


  def finished_all_vue_resource_requests?
    page.evaluate_script('window.activeVueResources || 0').zero?
  end


  def finished_all_ajax_requests?
    return true if page.evaluate_script('typeof jQuery === "undefined"')
    page.evaluate_script('jQuery.active').zero?
  end

end

World(RequestHelper)
