# frozen_string_literal: true

# controller
class DiseasesController < ApplicationController
  before_action :set_disease, only: %i[show edit update destroy]

  # GET /diseases
  def index
    @diseases = Disease.all
  end

  # GET /diseases/1
  def show; end

  # GET /diseases/new
  def new
    @disease = Disease.new
  end

  # GET /diseases/1/edit
  def edit; end

  # POST /diseases
  def create
    @disease = Disease.new(disease_params)

    if @disease.save
      redirect_to @disease, notice: 'Disease was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /diseases/1
  def update
    if @disease.update(disease_params)
      redirect_to @disease, notice: 'Disease was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /diseases/1
  def destroy
    @disease.destroy
    redirect_to diseases_url, notice: 'Disease was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_disease
    @disease = Disease.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def disease_params
    params.require(:disease).permit(:name)
  end
end
