class PlantsController < ApplicationController
    # GET plants
    def index
        render json: Plant.all, status: :ok
    end
# GET single plant
     def show

        plant = Plant.find_by(id: params[:id] )
        if plant
        render json: plant
        else
            render json: { error: "plant not found!"}, status: :not_found
        end
     end
# CREATE single plant
    def create 
      plant = Plant.create(plant_param)  
      render json: plant , status: :created    
    end
    private
    def plant_param
        params.permit( :name, :image, :price)
    end

end
