class CollectedPlantsController < ApplicationController
  def create
    plant = CollectedPlant.new(collected_plant_params)
    plant.owner = current_user
    if plant.save
      flash[:notice] = 'New plant added to collection'
      redirect_to collected_plants_url
    else
      flash[:alerts] = ['Failed to add new plant to collection']
      plant.errors.full_messages.each { |error| flash[:alerts].push(error) }
      redirect_to plant_species_index_url
    end
  end

  def index
    @collected_plants = current_user.collected_plants.includes(:species)
    @opened = params[:opened].to_i
  end

  def destroy
    plant = current_user.collected_plants.find(params[:id])

    if plant.destroy
      flash[:notice] = 'Successfully removed plant from collection'
    else
      flash[:alerts] = ['Failed to remove plant from collection']
      plant.errors.full_messages.each { |error| flash[:alerts].push(error) }
    end

    redirect_to collected_plants_url
  end

  def update
    plant = current_user.collected_plants.find(params[:id])

    if plant.update(last_time_watered: Time.current)
      flash[:notice] = "Successfully watered #{plant.nick_name || 'plant'}"
    else
      flash[:alerts] = ['Failed to water plant from collection']
      plant.errors.full_messages.each { |error| flash[:alerts].push(error) }
    end

    redirect_to collected_plants_url
  end

  def watering_report
    @plants = current_user.collected_plants.order(last_time_watered: :desc)
  end

  private

  def collected_plant_params
    params.require(:collected_plant).permit(:species_id, :nick_name)
  end
end
