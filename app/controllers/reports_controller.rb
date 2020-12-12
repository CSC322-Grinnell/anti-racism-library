class ReportsController < ApplicationController
  
  

  
  def new # create new report 
    
    @report = Report.new
    @item = Item.find(params[:item_id])
    
    return @report, @item
  end
  
  
  
  def create                                  #function meant to handle the creation of a new library item in the database
    @report, @item = Report.new(report_params)
    # @item = Item.find(params[:item_id])
    puts @item.title
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
