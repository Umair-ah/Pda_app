class DetailsController < ApplicationController
  before_action :set_detail, only: %i[ show  ]

  # GET /details or /details.json
  def index
    @details = Detail.all
  end

  # GET /details/1 or /details/1.json
  def show
  end

  # GET /details/new
  def new
    @detail = Detail.new
  end

  # GET /details/1/edit
  # def edit
  # end

  # POST /details or /details.json
  def create
    @detail = Detail.new(detail_params)

    respond_to do |format|
      if @detail.save
        format.html { redirect_to request.referrer, notice: "Detail was successfully created." }
        format.json { render :show, status: :created, location: @detail }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /details/1 or /details/1.json
  # def update
  #   respond_to do |format|
  #     if @detail.update(detail_params)
  #       format.html { redirect_to @detail, notice: "Detail was successfully updated." }
  #       format.json { render :show, status: :ok, location: @detail }
  #     else
  #       format.html { render :edit, status: :unprocessable_entity }
  #       format.json { render json: @detail.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # # DELETE /details/1 or /details/1.json
  # def destroy
  #   @detail.destroy!

  #   respond_to do |format|
  #     format.html { redirect_to details_path, status: :see_other, notice: "Detail was successfully destroyed." }
  #     format.json { head :no_content }
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_detail
      @detail = Detail.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def detail_params
      params.expect(detail: [ :faculty_name, :semester, :section, :academic_year, :subject_code, :co1, :co2, :co3, :co4, :co5, :see_co1_co5, :po1, :po2, :po3, :po4, :po5, :po6, :po7, :po8, :po9, :po10, :po11, :po12, :pso1, :pso2, :pso3, :approve, :target, :threshold, :excel_file])
    end
end
