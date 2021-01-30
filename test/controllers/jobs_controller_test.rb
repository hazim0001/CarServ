require 'test_helper'

class JobsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get jobs_index_url
    assert_response :success
  end

  test "should get new" do
    get jobs_new_url
    assert_response :success
  end

  test "should get create" do
    get jobs_create_url
    assert_response :success
  end

  test "should get edit" do
    get jobs_edit_url
    assert_response :success
  end

  test "should get update" do
    get jobs_update_url
    assert_response :success
  end

  test "should get set_job" do
    get jobs_set_job_url
    assert_response :success
  end

  test "should get job_params" do
    get jobs_job_params_url
    assert_response :success
  end

end
