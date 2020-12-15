class ItemsController < ApplicationController
  #This controller's function is for the items that are stored in the library database. It has operations that create, delete,
  #and edit the items

  #before_action :current_user.admin?         #WIP must verify that the user is an admin in order for to run any procudure in this controller. An admin

                                              #should be the only user that is able to add/edit/delete items in the database


  def index                                   #items in library
    if params[:filter].present?
      session[:filter] = params[:filter]
    end
    if params[:search]
      session[:search] = params[:search]
    end
    if not session[:search]
      session[:search]=nil
    end
    @items = search

    @approveds = @items.where(status: Item::APPROVED)

    if params[:search].blank?
      @page_title = "All library resources"
    elsif @approveds.empty?
      # case when there is no result
      @page_title = "Sorry, we cannot find any results for \"#{session[:search]}\":"
      
    elsif session[:search].nil? or session[:search]==""
      @page_title = "All library resources"

    else
      # case when we found the result
      @page_title = "Results for \"#{session[:search]}\":"
    end
     filter
  end

  def admin_index                             #denied and pending items in library
    if params[:filter].present?
      session[:filter] = params[:filter]
    end
    if params[:search]
      session[:search] = params[:search]
    end
    if not session[:search]
      session[:search]=nil
    end
    @items = search

    @pendings = @items.where(status: Item::PENDING)
    @denieds = @items.where(status: Item::DENIED)

    if session[:search].blank?
      @page_title = "All library resources"
    elsif @pendings.empty? && @denieds.empty?
      # case when there is no result
      @page_title = "Sorry, we cannot find any results for \"#{session[:search]}\":"
    else
      # case when we found the result
      @page_title = "Results for \"#{session[:search]}\":"
    end
    
    admin_filter
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

    redirect_to :action => 'admin_index'
  end

  def approve
    @item = Item.find(params[:id])
    @item.update_attribute(:status, Item::APPROVED)

    redirect_to :action => 'admin_index'
  end

  def pending
    @item = Item.find(params[:id])
    @item.update_attribute(:status, Item::PENDING)

    redirect_to :action => 'admin_index'
  end

  private

  def search                                  #function that find items matching the search phase.
    
    if  session[:search].blank?
      @items = Item.all
    else
      
      
      # get item by that is related to search phrase
      search_phrase = session[:search].downcase
      @items = Item.all.where("lower(author) LIKE :search or lower(title) LIKE :search or lower(description) LIKE :search", search: search_phrase)  
    end
  end
  
  def filter
    if session[:filter]!=nil and not session[:filter].blank? and not session[:filter]=="All"
      @approveds = @approveds.where(category: session[:filter])
    end
  end
  
  def admin_filter
    if session[:filter]!=nil and not session[:filter].blank? and not session[:filter]=="All"
      @pendings = @pendings.where(category: session[:filter])
      @denieds = @denieds.where(category: session[:filter])
    end
  end

  def item_params                             #verifies that the item being created has fulfilled all of the parameters
    params.require(:item).permit(:title, :author, :description, :category, :url)
  end
end