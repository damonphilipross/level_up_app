require 'test_helper'

class TaskResultsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get task_results_index_url
    assert_response :success
  end

end
