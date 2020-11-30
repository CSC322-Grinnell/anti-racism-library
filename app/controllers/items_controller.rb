class ItemsController < ApplicationController
  #This controller's function is for the items that are stored in the library database. It has operations that create, delete,
  #and edit the items
  
  #before_action :current_user.admin?         #WIP must verify that the user is an admin in order for to run any procudure in this controller. An admin
                                              #should be the only user that is able to add/edit/delete items in the database
  
  def index                                   #shows all library items in database
    # find approved items
    @items = find_approved
    if @items.nil?
      @items = []
    end
    
    # find pending items
    @pendings = find_pending
    if @pendings.nil?
      @pendings = []
    end
  end

  def show                                    #finds an individual item by their id
    @item = Item.find(params[:id])
  end
  
  def new                                     #creates new library item
    @item = Item.new
  end
  
  
  def edit                                    #edit library items
    @item = Item.find(params[:id])
  end
    
  def create                                  #function meant to handle the creation of a new library item in the database
    @item = Item.new(item_params)
    if @item.save
      flash[:success] = "You have added a new resource item to the library!"
      redirect_to '/items/new'
    else
      render 'new'
    end
  end 

  def update                                   #function that handles updating library items. 
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to @item
    else
      render 'edit'
    end
  end
 
  def destroy                                 #function that handles destruction of library items. 
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to 'items'
  end
 
 
  # Modifying status
  def deny
     @item = Item.find(params[:id])
     @item.update_attribute(:status, Item::DENIED)
     
     redirect_to :action => 'index'
  end
  
  def approve
    @item = Item.find(params[:id])
    @item.update_attribute(:status, Item::APPROVED)
    
    redirect_to :action => 'index'
  end
  
  
  private
  
  # find all pending items in the database
  def find_pending
    Item.where(status: Item::PENDING)
  end
  
  # find all approved items in the database
  def find_approved
     Item.where(status: Item::APPROVED)
  end
  
  
  def item_params                             #verifies that the item being created has fulfilled all of the parameters
    params.require(:item).permit(:title, :author, :description, :category, :url)
  end
  
end
