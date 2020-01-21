class Api::V1::CarModelsController < Api::V1::ApiController
  def show
    @car_model = CarModel.find(params[:id])

    render json: @car_model
  end
end
