require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  
  def setup
    @item = Item.new(title: "Example Item", 
                     author: "Example Author", 
                     description: "Example Description", 
                     url: "example.com", 
                     category: "Journal")
  end
    
  #### VALIDATION CHECKS ####
    
  # the setup item should be valid 
  test "should be valid" do
    assert @item.valid?
  end
  
  test "title should be present and within char limits" do
    # if there is no title, not valid
    @item.title = " "
    assert_not @item.valid?
    
    # if title is longer than 1000 char, not valid
    @item.title = 'a' * 1001
    assert_not @item.valid?
  end
  
  
  test "author should be present and within char limits" do
    # if there is no author, not valid
    @item.author = " "
    assert_not @item.valid?
    
    # if the author is longer than 1000 char, not valid
    @item.author = 'a' * 1001
    assert_not @item.valid?
  end
  
  
  test "description should be present and within char limits" do
    # if there is no description, not valid
    @item.description = " "
    assert_not @item.valid?
    
    # if the description if longer than 1000 char, not valid
    @item.description = 'a' * 1001
    assert_not @item.valid?
  end
  
  test "url should be present" do 
    # if there is no url, not valid
    @item.url = " "
    assert_not @item.valid?
  end 
  
  test "category should be present and valid" do       ### note that category is stored as a string, but is shown as a drop down menu
    # if there is no category, not valid 
    @item.category = " "
    assert_not @item.valid?
  end 
  
  
end
