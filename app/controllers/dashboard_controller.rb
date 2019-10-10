class DashboardController < ApplicationController
  def home
  end
  def index
  @user = User.all
  end

  def Lib_approvals
    @lib = User.all.where(user_type:'librarian').where(l_approved:nil)
  end

  def show
  # @users = User.all.find(params[:id])
   @users = User.find_by_id(params[:id])
  end

  def edit
    @edit_user = User.find_by_id(params[:id])
  end

  def update
    @edit_user = User.find_by_id(params[:id])
    if(User.find_by_id(params[:id]).user_type=="student")
    if User.update(User.find_by_id(params[:id]).id,{:email=>params[:email],:password=>params[:current_password],:reset_password_token=>@edit_user.reset_password_token,:reset_password_sent_at=>@edit_user.reset_password_sent_at,:remember_created_at=>@edit_user.remember_created_at,:created_at=>@edit_user.created_at,:updated_at=>@edit_user.updated_at,:user_type=>@edit_user.user_type,:u_name=>params[:u_name],:library_id=>@edit_user.library_id,:l_approved=>@edit_user.l_approved,:s_education=>params[:s_education],s_max:params[:s_max]})

      respond_to do |form|
       form.html{redirect_to dashboard_url(1), alert: "updated successfully"}
        end
    end
    elsif(User.find(params[:id]).user_type=="librarain")

      end
  end
  def deleteuser
    if User.find(params[:id]).destroy
    respond_to do |form|
      form.html{redirect_to dashboard_url(1), alert: "deleted successfully"}
    end
    end
  end
end
