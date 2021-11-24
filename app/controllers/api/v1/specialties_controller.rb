module Api 
    module V1
        class SpecialtiesController < ApplicationController
            def index
                specialties = Specialty.order(:name)
                render json: {status: 'SUCCESS', message: 'Especialidades carregadas', data: specialties}, status: :ok
            end
            
            def show
                specialty = Specialty.find(params[:id])
                render json: {status: 'SUCCESS', message: 'Especialidade Carregada', data: specialty}, status: :ok
            end

            def create 
                specialty = Specialty.new(specialty_params)
                if specialty.save
                    render json: {status: 'SUCCESS', message: 'Especialidade salva', data: specialty}, status: :ok
                else
                    render json: {status: 'ERROR', message: 'Especialidade não salva', data: specialty}, status: :unprocessable_entity
                end
            end

            private 

            def specialty_params
                params.permit(:name)
            end
        end
    end
end