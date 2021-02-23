class ReportsController < ApplicationController
  
  

  
  def new # create new report 
    
    # allows item to be accessed on report page (used for title and author)
    @item = Item.find(params[:item_id])
    
    # associates item_id with report, automatically adds to schema
    @report = Report.new(item_id: params[:item_id])
    
  end
  
  def show                                    #finds an individual item by their id
    @report = Report.find(params[:id])
    @item = Item.find(@report.item_id)
  end

  def create                                  #function meant to handle the creation of a new library item in the database
    @report= Report.new(report_params)
    if @report.save
      flash[:success] = "You have created a new report!"
      item = Item.find
      redirect_to item
    else
      render 'new'
    end
  end

  # set the item to Item::DENIED and mark the current report as Resolved, redirect to admin page
  def deny_item_and_resolve
    @report = Report.find(params[:id])
    @item = Item.find(@report.item_id)
    @item.update_attribute(:status, Item::DENIED)

    # resolve the current report
    @report.update_attribute(:status, Report::RESOLVED)
    redirect_to :controller => 'items', :action => 'admin_index'
  end

  # mark the report as resolved, redirect to admin page
  def resolve
    @report = Report.find(params[:id])
    @report.update_attribute(:status, Report::RESOLVED)
    redirect_to :controller => 'items', :action => 'admin_index'
  end
  
  
  def report_params                             #verifies that the item being created has fulfilled all of the parameters
    params.require(:report).permit(:reason, :message, :item_id)
  end
  
  
end
