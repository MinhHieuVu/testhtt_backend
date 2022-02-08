class GroupCategoriesController < ApplicationController
  before_action :set_group_category, only: %i[ show edit update destroy ]

  # GET /group_categories or /group_categories.json
  def index
    @group_categories = GroupCategory.all
    # @limit = 100
    # @group_categories = GroupCategory.paginate(:page => params[:page], :per_page => @limit)
    # if @group_categories.size == 0
    #   group_category = GroupCategory.create(name: "Đề thi theo level")
    #   @group_categories = [group_category]
    # end
  end

  # GET /group_categories/1 or /group_categories/1.json
  def show
  end

  # GET /group_categories/new
  def new
    @group_category = GroupCategory.new
  end

  # GET /group_categories/1/edit
  def edit
  end

  # POST /group_categories or /group_categories.json
  def create
    @group_category = GroupCategory.new(group_category_params)

    respond_to do |format|
      if @group_category.save
        format.html { redirect_to group_category_categories_path(@group_category), notice: "Group category was successfully created." }
        format.json { render :show, status: :created, location: @group_category }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @group_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /group_categories/1 or /group_categories/1.json
  def update
    respond_to do |format|
      if @group_category.update(group_category_params)
        format.html { redirect_to group_category_path(@group_category), notice: "Group category was successfully updated." }
        format.json { render :show, status: :ok, location: @group_category }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @group_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /group_categories/1 or /group_categories/1.json
  def destroy
    @group_category.destroy

    respond_to do |format|
      format.html { redirect_to group_categories_url, notice: "Group category was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group_category
      @group_category = GroupCategory.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def group_category_params
      params.require(:group_category).permit(:name)
    end
end
