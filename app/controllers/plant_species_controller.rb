class PlantSpeciesController < ApplicationController
  before_action :authenticate_user!
  def index
    @plant_species = PlantSpecies.all
    @collected_plant = CollectedPlant.new
  end

  def new
    @plant_species = PlantSpecies.new
  end

  def create
    @plant_species = PlantSpecies.new(plant_species_params)

    if @plant_species.save
      flash[:notice] = 'Saved new plant species'
      redirect_to plant_species_url(@plant_species.id)
    else
      flash[:alerts] = ['Failed to save new plant species']
      @plant_species.errors.full_messages.each { |error| flash[:alerts].push(error) }
      render :new
    end
  end

  def show
    @plant_species = PlantSpecies.find(params[:id])
  end

  def edit
    @plant_species = PlantSpecies.find(params[:id])
  end

  def update
    @plant_species = PlantSpecies.find(params[:id])

    if @plant_species.update(plant_species_params)
      flash[:notice] = "Plant Species #{@plant_species.scientific_name} updated!"
      redirect_to plant_species_url(@plant_species)
    else
      flash[:alerts] = ['Failed to update plant species']
      @plant_species.errors.full_messages.each { |error| flash[:alerts].push(error) }
      render :edit
    end
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

  def search
    @found_plant_species = PlantSpecies.with_scientific_name_like(query).or(PlantSpecies.with_common_name_like(query))
    @collected_plant = CollectedPlant.new
  end

  private

  def query
    @query ||= params[:query]
  end

  def plant_species_params
    params.require(:plant_species).permit(:scientific_name, :common_name, :care_instructions, :light_level, :watering_interval)
  end
end
