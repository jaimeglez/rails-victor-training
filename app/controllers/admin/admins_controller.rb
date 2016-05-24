class Admin::AdminsController < Admin::AdminController
  load_and_authorize_resource except: :create

  rescue_from CanCan::AccessDenied do |exception|
    @admin= Admin.find(current_admin)
    redirect_to admin_admin_articles_path(@admin)
  end

  def index
    @admins = Admin.page(params[:page])
  end

  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.new(admin_params)
    if @admin.save
      redirect_to admin_admins_path(@admin)
    else
      render 'new'
    end
  end

  def show
    @admin = Admin.find(params[:id])
  end

  def edit
    @admin = Admin.find(params[:id])
  end

  def update
    @admin = Admin.find(params[:id])
    if @admin.update(admin_params)
      redirect_to admin_admins_path(@admin)
    else
      render 'edit'
    end
  end

  def destroy
    @admin = Admin.find(params[:id])
      if @admin.destroy
        redirect_to admin_admins_path(@admin)
        flash[:success] = "Usuario eliminado correctamente!"
      else
        redirect_to admin_admins_path(@admin)
        flash[:danger] = "El usurario no se pudo eleiminar correctamente, intente mas tarde."
      end
  end

  private
    def admin_params
      params.require(:admin).permit(:username, :email, :email_confirmation, :password, :role)
    end
end
