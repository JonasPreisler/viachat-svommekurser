class SortingsController < ApplicationController
  before_action :set_sorting, only: [:show, :edit, :update, :destroy]

  # GET /sortings
  # GET /sortings.json
  def index
    @sortings = Sorting.all
  end

  # GET /sortings/1
  # GET /sortings/1.json
  def show
  end

  # GET /sortings/new
  def new
    @sorting = Sorting.new
  end

  # GET /sortings/1/edit
  def edit
  end

  # POST /sortings
  # POST /sortings.json
  def create
    @sorting = Sorting.new(sorting_params)

    respond_to do |format|
      if @sorting.save
        format.html { redirect_to new_sorting_path, notice: 'Sorting was successfully created.' }
        format.json { render :show, status: :created, location: @sorting }
      else
        format.html { render :new }
        format.json { render json: @sorting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sortings/1
  # PATCH/PUT /sortings/1.json
  def update
    respond_to do |format|
      if @sorting.update(sorting_params)
        format.html { redirect_to @sorting, notice: 'Sorting was successfully updated.' }
        format.json { render :show, status: :ok, location: @sorting }
      else
        format.html { render :edit }
        format.json { render json: @sorting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sortings/1
  # DELETE /sortings/1.json
  def destroy
    @sorting.destroy
    respond_to do |format|
      format.html { redirect_to sortings_url, notice: 'Sorting was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sorting
      @sorting = Sorting.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sorting_params
      params.fetch(:sorting, {}, :program_id)
    end
end
