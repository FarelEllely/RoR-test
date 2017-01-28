class AdminController < ApplicationController
  before_filter :authorize_admin, only: :index
    def index
      @users = User.all.limit(10)
      @categories = Category.all.limit(5)
    end

    def new
      @Admin_category = Category.new
    end

    def create
      @Admin_category = Category.new(cat_params)
      if @Admin_category.save
        redirect_to admin_panel_path
      else
        render :new
      end
    end

    private
    def cat_params
      params.require(:category).permit(:name)
    end

    def authorize_admin
    redirect_to :back, status: 401 unless current_user.admin?
    #redirects to previous page
    end
end
