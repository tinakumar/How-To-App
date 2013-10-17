class StepsController < ApplicationController
  before_action :set_step, only: [:show, :edit, :update, :destroy]

  # GET /steps
  # GET /steps.json
  def index
    list = List.find(params[:list_id])
    @steps = list.steps
  end

  # GET /steps/1
  # GET /steps/1.json
  def show
    list = List.find(params[:list_id])
    @step = list.steps.find(params[:id])
  end

  # GET /steps/new
  def new
    @list = List.find_by_id(params[:list_id])
    @step = @list.steps.build
  end

  # GET /steps/1/edit
  def edit
    list = List.find(params[:list_id])
    @step = list.steps.find(params[:id])
  end

  # POST /steps
  # POST /steps.json
  def create
    @list = List.find_by_id(params[:list_id])
    @step = @list.steps.create(step_params)


    respond_to do |format|
      if @step.save
        format.html { redirect_to([@step.list, @step], :notice => 'Step was successfully created.') }
        format.json { render action: 'show', status: :created, location: [@step.list, @step] }
      else
        format.html { render :action => "new" }
        format.json { render json: @step.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /steps/1
  # PATCH/PUT /steps/1.json
  def update
    respond_to do |format|
      if @step.update(step_params)
        format.html { redirect_to([@step.list, @step], :notice => 'Step was successfully updated.') }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @step.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /steps/1
  # DELETE /steps/1.json
  def destroy
    list = List.find(params[:list_id])
    @step = list.steps.find(params[:id])
    @step.destroy
    respond_to do |format|
      format.html { redirect_to list_steps_path }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_step
      @step = Step.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def step_params
      params.require(:step).permit(:description, :list_id)
    end
end
