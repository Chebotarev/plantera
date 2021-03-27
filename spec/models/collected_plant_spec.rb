# == Schema Information
#
# Table name: collected_plants
#
#  id                :integer          not null, primary key
#  last_time_watered :datetime
#  nick_name         :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  owner_id          :integer          not null
#  species_id        :integer          not null
#
# Indexes
#
#  index_collected_plants_on_last_time_watered  (last_time_watered)
#  index_collected_plants_on_nick_name          (nick_name)
#  index_collected_plants_on_owner_id           (owner_id)
#  index_collected_plants_on_species_id         (species_id)
#
# Foreign Keys
#
#  owner_id    (owner_id => users.id)
#  species_id  (species_id => plant_species.id)
#
require 'rails_helper'
require 'pry-rails'

RSpec.describe CollectedPlant, type: :model do
  describe '#watering_status' do
    context 'with a content plant' do
      let(:content_plant) { build :content_plant }

      it 'returns :content' do
        expect(content_plant.watering_status).to eq(:content)
      end
    end

    context 'with a wanting plant' do
      let(:wanting_plant) { build :wanting_plant }

      it 'returns :wanting' do
        expect(wanting_plant.watering_status).to eq(:wanting)
      end
    end

    context 'with a deprived plant' do
      let(:deprived_plant) { build :deprived_plant }

      it 'returns :deprived' do
        expect(deprived_plant.watering_status).to eq(:deprived)
      end
    end
  end
end
