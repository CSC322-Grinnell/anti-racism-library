class ItemsController < ApplicationController
  
  
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  
  def new
    @item = Item.new
  end
  
  
  def edit
    @item = Item.find(params[:id])
  end
   
  
 
   #if current_user.try(:admin?)
  def create
    @item = Item.new(item_params)
    if @item.save
        flash[:success] = "You have added a new resource item to the library!"
        redirect_to '/items/new'
    else
        render 'new'
    end
  end 
   #end
  
  
  

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
        redirect_to @item
    else
        render 'edit'
    end
  end
 
 
 
 
  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to items_path
  end
 
 
  private
  def item_params
    params.require(:item).permit(:title, :author, :description, :category, :url)
  end
  
  #def current_user
    #return unless session[:user_id]
    #@current_user ||= User.find(session[:user_id])
  #end

  #def logged_in?
    #!!session[:user_id]
  #end
  
  
end
