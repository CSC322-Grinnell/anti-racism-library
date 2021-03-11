class AdminController < ApplicationController
    before_action :check_admin  

    def check_admin
        if current_user == nil or !current_user.admin
          redirect_to '/items/not_admin'
        end
    end 

    def user_console
        @everyone = User.all

        @admins = @everyone.where(admin: true)
        @users = @everyone.where(admin: false)
    end

    def promote
        @user = User.find(params[:id])
        @user.update_attribute(:admin, true)
    
        redirect_to :action => 'user_console'
    end

    def demote
        @user = User.find(params[:id])
        @user.update_attribute(:admin, false)
    
        redirect_to :action => 'user_console'
    end
end
