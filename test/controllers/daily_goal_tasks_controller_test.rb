require 'test_helper'

class DailyGoalTasksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get daily_goal_tasks_index_url
    assert_response :success
  end

end
