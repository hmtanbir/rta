class AgesController < ApplicationController
  before_action :set_age, only: [:show, :edit, :update, :destroy]

  # GET /ages
  def index
    @ages = Age.all
  end

  # GET /ages/1
  def show
  end

  # GET /ages/new
  def new
    @age = Age.new
  end

  # GET /ages/1/edit
  def edit
  end

  # POST /ages
  def create
    @age = Age.new(age_params)

    if @age.save
      redirect_to @age, notice: 'Age was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /ages/1
  def update
    if @age.update(age_params)
      redirect_to @age, notice: 'Age was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /ages/1
  def destroy
    @age.destroy
    redirect_to ages_url, notice: 'Age was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_age
      @age = Age.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def age_params
      params.require(:age).permit(:range)
    end
end
