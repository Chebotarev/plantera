class PlantSpeciesController < ApplicationController
  def index
    @plant_species = PlantSpecies.all
  end

  def create
  end

  def show
    @plant_species = PlantSpecies.find(params[:id])
  end

  def edit
  end

  def new
  end

  def update
  end

  def destroy
  end

end
