class ItemsController < ApplicationController
  #This controller's function is for the items that are stored in the library database. It has operations that create, delete,
  #and edit the items
  
  #before_action :current_user.admin?         #WIP must verify that the user is an admin in order for to run any procudure in this controller. An admin
                                              #should be the only user that is able to add/edit/delete items in the database
  
  def index                                   #shows all library items in database
    @items = self.search
    if @items.nil?
      @items = Item.all
    else
      @items
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
    redirect_to items_path
  end
  
  def search                                  #function that find items matching the search phase.
    if  params[:search].blank?
      @items = nil
    else
      # get item by that is related to search phrase
      search_phrase = params[:search].downcase
      item_by_author = Item.all.where("lower(author) LIKE :search", search: search_phrase)  
      item_by_title = Item.all.where("lower(title) LIKE :search", search: search_phrase)  
      item_by_description = Item.all.where("lower(description) LIKE :search", search: search_phrase)  
      
      # Union the search result
      @items = item_by_title | item_by_author | item_by_description
    end
  end
 
  private
  def item_params                             #verifies that the item being created has fulfilled all of the parameters
    params.require(:item).permit(:title, :author, :description, :category, :url)
  end
end
