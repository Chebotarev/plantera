class PlantSpeciesController < ApplicationController
  def index
    @plant_species = PlantSpecies.all
  end

  def create
    plant_species = PlantSpecies.new(new_plant_species_params)

    # Temp hardcode of water/light level
    plant_species.light_level = 1
    plant_species.watering_interval = 1

    if plant_species.save
      redirect_to plant_species_url(plant_species.id)
    else
      fail
    end
  end

  def show
    @plant_species = PlantSpecies.find(params[:id])
  end

  def edit
  end

  def new
    @plant_species = PlantSpecies.new
  end

  def update
  end

  def destroy
    @plant_species = PlantSpecies.find(params[:id])

    if @plant_species.destroy
      flash[:notice] = "Deleted #{@plant_species.scientific_name}"
    else
      flash[:alerts] = ["Failed to delete #{@plant_species.scientific_name}"]
      @plant_species.errors.full_messages.each { |error| flash[:alerts].push(error) }
    end

    redirect_to plant_species_index_url
  end

  private

  def new_plant_species_params
    params.require(:plant_species).permit(:scientific_name, :common_name, :care_instructions)
  end
end
