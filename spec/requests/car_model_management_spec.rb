require 'rails_helper'

describe 'CarModel Management' do
  context 'show' do
    it 'renders car model correctly' do
      car_model = create(:car_model)

      get api_v1_car_model_path(car_model)
      json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(:ok)
      expect(json[:name]).to eq(car_model.name)
      expect(json[:year]).to eq(car_model.year)
      expect(json[:fuel_type_id]).to eq(car_model.fuel_type_id)
    end

    it 'model not found' do
      get api_v1_car_model_path(id: 999)

      expect(response).to have_http_status(:not_found)
    end
  end
end

'{
  "name": "Uno",
  "fuel_type_id": 1,
  "manufacturer_id": 1,
  "car_options": "ar condicionado"
}'
