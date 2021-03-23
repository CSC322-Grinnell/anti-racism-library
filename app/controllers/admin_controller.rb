class AdminController < ApplicationController
    before_action :check_admin  

    def check_admin
        if current_user == nil or !current_user.admin
          redirect_to '/items/not_admin'
        end
    end 

    def user_console
        @everyone = User.all

        @admins = User.admins
        @users = User.users
    end

    def show_user
        @user = User.find(params[:id])
        @multiple_admins = User.admins.count > 1
        #redirect_to :action => 'show_user'
    end

    def promote
        @user = User.find(params[:id])
        @user.update_attribute(:admin, true)
        @user.update_attribute(:banned, false)
    
        redirect_to :action => 'user_console'
    end

    def demote
        if User.admins.count > 1
            @user = User.find(params[:id])
            @user.update_attribute(:admin, false)
        end
    
        redirect_to :action => 'user_console'
    end

    def ban
        @user = User.find(params[:id])
        @user.update_attribute(:banned, true)
        @user.update_attribute(:admin, false)
    
        redirect_to :action => 'user_console'
    end

    def unban
        @user = User.find(params[:id])
        @user.update_attribute(:banned, false)
    
        redirect_to :action => 'user_console'
    end
end
