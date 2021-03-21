class CollectedPlantsController < ApplicationController
  def create
    plant = CollectedPlant.new(collected_plant_params)
    plant.owner = current_user
    if plant.save
      flash[:notice] = 'New plant added to collection'
      redirect_to collected_plants_url
    else
      fail
    end
  end

  def index
    @collected_plants = current_user.collected_plants.includes(:species)
  end

  def destroy
  end

  def update
  end

  private

  def collected_plant_params
    params.require(:collected_plant).permit(:species_id, :nick_name)
  end
end
