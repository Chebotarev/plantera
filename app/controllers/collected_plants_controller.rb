class CollectedPlantsController < ApplicationController
  def new
  end

  def index
    @collected_plants = current_user.collected_plants.includes(:species)
  end

  def destroy
  end

  def update
  end
end
