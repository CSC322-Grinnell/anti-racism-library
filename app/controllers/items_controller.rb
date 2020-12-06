class ItemsController < ApplicationController
  #This controller's function is for the items that are stored in the library database. It has operations that create, delete,
  #and edit the items
  
  #before_action :current_user.admin?         #WIP must verify that the user is an admin in order for to run any procudure in this controller. An admin
                                              #should be the only user that is able to add/edit/delete items in the database
  

  def index                                   #items in library
    @items = search

    if params[:search].blank?
      @page_title = "All library resources"
    elsif @items.empty?
      # case when there is no result
      @page_title = "Must type exact title \"#{params[:search]}\":"
    else
      # case when we found the result
      @page_title = "Results for \"#{params[:search]}\":"
    end

    @pendings, @approveds = [], []

    @items.each do |item|
      @pendings << item if item.status == Item::PENDING
      @approveds << item if item.status == Item::APPROVED
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

  def search                                  #function that find items matching the search phase.
    if  params[:search].blank?
      @items = Item.all
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

  def item_params                             #verifies that the item being created has fulfilled all of the parameters
    params.require(:item).permit(:title, :author, :description, :category, :url)
  end
end
