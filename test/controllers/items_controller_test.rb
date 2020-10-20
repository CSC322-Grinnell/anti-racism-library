require 'test_helper'

class ItemsControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @item = Item.create(title: "Example Item", 
                    author: "Example Author", 
                    description: "Example Description", 
                    url: "example.com", 
                    category: "Journal")
      # total number of items in database is: 6
    
    @invalid_item = Item.create(title: "", 
                            author: "", 
                            description: "", 
                            url: "", 
                            category: "Journal")
  end
  
  
  
#### PAGE REQUEST TESTS ####

  test "should get new" do
    get items_new_url
    assert_response :success
  end
  
  test "should get index (all resources)" do 
    get items_path
    assert_response :success
  end 

  
#### FUNCTIONALITY TESTS ####

  test "destroyed item no longer exists" do 
    item_old_count =  Item.count
    @item = Item.create(title: "New Example Item", 
                        author: "Example Author", 
                        description: "Example Description", 
                        url: "example.com", 
                        category: "Journal")
    assert_equal(item_old_count + 1, Item.count, "added item successfully")
    @item.destroy
    assert_equal(item_old_count, Item.count, "deleted item successfully")
  end 

  test "invalid item isn't saved" do 
    item_count = Item.count
    @invalid_item = Item.create(title: "", 
                             author: "", 
                             description: "", 
                             url: "", 
                             category: "Journal")
    new_item_count = Item.count 
    assert_equal(item_count, new_item_count, "invalid item isn't saved")
  end
  
  test "new items are saved to database" do 
    item_count = Item.count
    @item = Item.create(title: "New Example Item", 
                        author: "Example Author", 
                        description: "Example Description", 
                        url: "example.com", 
                        category: "Journal")
    new_item_count = Item.count 
    net = new_item_count - item_count
    assert_equal(net, 1, "valid item is saved")
    @item.destroy
  end 
  
  test "update item does not add a new item" do
    old_count = Item.count
    @item.update(title: "Updated Example Item", 
                 author: "Updated Example Author", 
                 description: "Updated Example Description", 
                 url: "updatedexample.com", 
                 category: "Book")
    new_count = Item.count
    assert_equal(old_count, new_count)
  end 
  
  test "update item has updated parameters" do 
   @item.update(title: "Updated New Example Item", 
                author: "Updated New Example Author", 
                description: "Updated New Example Description", 
                url: "updatednewexample.com", 
                category: "Book") 
    
   result = @item.title <=> "Updated New Example Item"
   assert_equal(result, 0, "title not updated properly")
   result = @item.author <=> "Updated New Example Author"
   assert_equal(result, 0, "author not updated properly")
   result = @item.description <=> "Updated New Example Description"
   assert_equal(result, 0, "description not updated properly")
   result = @item.url <=> "updatednewexample.com"
   assert_equal(result, 0, "url not updated properly")
   result = @item.category <=> "Book"
   assert_equal(result, 0, "category not updated properly")
  end 
  
  test "cannot get item that doesn't exist" do 
    item_count = Item.count
    result = Item.find_by id: item_count + 1
    assert_nil(result, "found an item that doesn't exist")
  end 

end
