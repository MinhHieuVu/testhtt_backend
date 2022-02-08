class GroupQuestionsController < ApplicationController
  before_action :set_group_question, only: %i[ show edit update destroy ]

  # GET /group_questions or /group_questions.json
  def index
    @group_questions = GroupQuestion.all
  end

  # GET /group_questions/1 or /group_questions/1.json
  def show
  end

  # GET /group_questions/new
  def new
    @group_question = GroupQuestion.new
  end

  # GET /group_questions/1/edit
  def edit
  end

  # POST /group_questions or /group_questions.json
  def create
    @group_question = GroupQuestion.new(group_question_params)

    respond_to do |format|
      if @group_question.save
        format.html { redirect_to group_question_url(@group_question), notice: "Group question was successfully created." }
        format.json { render :show, status: :created, location: @group_question }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @group_question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /group_questions/1 or /group_questions/1.json
  def update
    respond_to do |format|
      if @group_question.update(group_question_params)
        format.html { redirect_to group_question_url(@group_question), notice: "Group question was successfully updated." }
        format.json { render :show, status: :ok, location: @group_question }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @group_question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /group_questions/1 or /group_questions/1.json
  def destroy
    @group_question.destroy

    respond_to do |format|
      format.html { redirect_to group_questions_url, notice: "Group question was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group_question
      @group_question = GroupQuestion.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def group_question_params
      params.require(:group_question).permit(:name, :description, :content, :guide, :transcript, :test_id, :parent_id)
    end
end
