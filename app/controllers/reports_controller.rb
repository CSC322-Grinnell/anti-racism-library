class ReportsController < ApplicationController
  
  

  
  def new # create new report 
    
    # allows item to be accessed on report page (used for title and author)
    @item = Item.find(params[:item_id])
    
    # associates item_id with report, automatically adds to schema
    @report = Report.new(item_id: params[:item_id])
    
  end
  
  
  
  def create                                  #function meant to handle the creation of a new library item in the database
    @report= Report.new(report_params)
    if @report.save
      flash[:success] = "You have created a new report!"
      redirect_to '/'
    else
      render 'new'
    end
  end
  
  
  def report_params                             #verifies that the item being created has fulfilled all of the parameters
    params.require(:report).permit(:reason, :message, :item_id)
  end
  
  
end
