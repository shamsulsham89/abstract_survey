require 'test_helper'

class SurveysControllerTest < ActionController::TestCase
  setup do
    @survey = surveys(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:surveys)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create survey" do
    assert_difference('Survey.count') do
      post :create, survey: { outlet_type_id: @survey.outlet_type_id, promoter_of_braun: @survey.promoter_of_braun, promoter_of_philips: @survey.promoter_of_philips, rate_the_communication_skill_of_the_braun: @survey.rate_the_communication_skill_of_the_braun, rate_the_communication_skill_of_the_philips: @survey.rate_the_communication_skill_of_the_philips, rate_the_presentability_of_braun: @survey.rate_the_presentability_of_braun, rate_the_presentability_of_the_philips: @survey.rate_the_presentability_of_the_philips, stock_availability_of_philips: @survey.stock_availability_of_philips, stock_availability_of_the_braun: @survey.stock_availability_of_the_braun, time_spent_at_the_braun: @survey.time_spent_at_the_braun, time_spent_at_the_philips: @survey.time_spent_at_the_philips, user_id: @survey.user_id, visibility_of_philips: @survey.visibility_of_philips, visibility_of_the_braun: @survey.visibility_of_the_braun }
    end

    assert_redirected_to survey_path(assigns(:survey))
  end

  test "should show survey" do
    get :show, id: @survey
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @survey
    assert_response :success
  end

  test "should update survey" do
    put :update, id: @survey, survey: { outlet_type_id: @survey.outlet_type_id, promoter_of_braun: @survey.promoter_of_braun, promoter_of_philips: @survey.promoter_of_philips, rate_the_communication_skill_of_the_braun: @survey.rate_the_communication_skill_of_the_braun, rate_the_communication_skill_of_the_philips: @survey.rate_the_communication_skill_of_the_philips, rate_the_presentability_of_braun: @survey.rate_the_presentability_of_braun, rate_the_presentability_of_the_philips: @survey.rate_the_presentability_of_the_philips, stock_availability_of_philips: @survey.stock_availability_of_philips, stock_availability_of_the_braun: @survey.stock_availability_of_the_braun, time_spent_at_the_braun: @survey.time_spent_at_the_braun, time_spent_at_the_philips: @survey.time_spent_at_the_philips, user_id: @survey.user_id, visibility_of_philips: @survey.visibility_of_philips, visibility_of_the_braun: @survey.visibility_of_the_braun }
    assert_redirected_to survey_path(assigns(:survey))
  end

  test "should destroy survey" do
    assert_difference('Survey.count', -1) do
      delete :destroy, id: @survey
    end

    assert_redirected_to surveys_path
  end
end
