require 'test_helper'

class NonLibraryPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get contact-us" do
    get contact_us_url
    assert_response :success
  end

  test "should get suggest-resource" do
    get suggest_a_resource_url
    assert_response :success
  end

  test "should get about-us" do
    get about_us_url
    assert_response :success
  end
  
    test "should get root/home" do 
    get root_url
    assert_response :success
  end 

end
