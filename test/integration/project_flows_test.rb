require 'test_helper'

class ProjectFlowsTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test "browsing projects" do
  	project1 = FactoryGirl.create(:project, :title => "Project 1")
  	project2 = FactoryGirl.create(:project, :title => "project 2")
  	project3 = FactoryGirl.create(:project, :title => "project 3")

  #Go to the page with projects
  visit "/projects"

  #Go to the page with the projects
  assert_equal projects_path, current_path

  #Assert this page has the words 'Listing Projects'
  assert page.has_content?('Listing Projects')

  #Assert this page has these words as well
  assert page.has_content?('Project 1')
  assert page.has_content?('Project 2')
  assert page.has_content?('Project 3')
end


end
