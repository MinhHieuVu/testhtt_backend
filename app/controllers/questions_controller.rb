class QuestionsController < ApplicationController
  before_action :set_question, only: %i[ show edit update destroy ]
  before_action :set_group_question, only: [:new, :edit]

  # GET /questions or /questions.json
  def index
    @questions = Question.all
  end

  # GET /questions/1 or /questions/1.json
  def show
  end

  # GET /questions/new
  def new
    @question = Question.new
    # 4.to_i.times do
    #   @question.question_options.build
    # end
  end

  # GET /questions/1/edit
  def edit
    if @question.question_type.present?
      if @question.question_type == 'single_choice'
        number = 4
      elsif @question.question_type == 'multiple_choice'
        number = 5
      else
        number = 0
      end

      number.to_i.times do
        @question.question_options.build
      end
    end
  end

  # POST /questions or /questions.json
  def create
    @question = Question.new(question_params)

    respond_to do |format|
      if @question.save
        format.html { redirect_to group_question_path(@question.group_question_id), notice: "Question was successfully created." }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questions/1 or /questions/1.json
  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to group_question_path(@question.group_question_id), notice: "Question was successfully updated." }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1 or /questions/1.json
  def destroy
    @question.destroy

    respond_to do |format|
      format.html { redirect_to group_question_path(@question.group_question_id), notice: "Question was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_group_question
    if @question.present?
      @group_question = @question.group_question
      @group_question_id = @group_question.id
    else
      @group_question_id = params[:group_question_id]
      @group_question = GroupQuestion.find(@group_question_id) if @group_question_id.blank?
    end
  end
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def question_params
      params.require(:question).permit(:group_question_id, :question_number, :name, :content, :explanation, :answer, :difficulty, :score, :status, :question_type , question_options_attributes: [:id, :content, :is_answer, :explanation, :position])
    end
end
