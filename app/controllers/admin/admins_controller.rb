class Admin::AdminsController < Admin::BaseController
  authorize_resource
  def index
    @admins = Admin.all
  end

  def new
    @admin = Admin.new
  end

  def edit
    @admin = Admin.find(params[:id])
  end

  def create
    @admin = Admin.new(admin_params)

    respond_to do |format|
      if @admin.save
        format.html { redirect_to admin_admins_path, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @admin }
      else
        format.html { render :new }
        format.json { render json: @admin.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @admin = Admin.find(params[:id])
    respond_to do |format|
      if @admin.update(admin_params)
        format.html { redirect_to admin_admins_path, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin }
      else
        format.html { render :edit }
        format.json { render json: @admin.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @admin=Admin.find(params[:id])
    @admin.destroy
    respond_to do |format|
      format.html { redirect_to admin_admins_path, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin
      @admin = Admin.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_params
      params.require(:admin).permit(:email, :login, :password, :password_confirmation, roles: [])
    end
end
