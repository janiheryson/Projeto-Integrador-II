module Api 
    module V1
        class DoctorsController < ApplicationController
            def index
                doctors = Doctor.order(:fullname)
                render json: {status: 'SUCCESS', message: 'Profissionais Carregados', data: doctors}, status: :ok
            end
            
            def show
                doctor = Doctor.find(params[:id])
                render json: {status: 'SUCCESS', message: 'Profissional Carregado', data: doctor}, status: :ok
            end

            def create 
                doctor = Doctor.new(doctor_params)
                if doctor.save
                    render json: {status: 'SUCCESS', message: 'Profissional Salvo', data: doctor}, status: :ok
                else
                    render json: {status: 'ERROR', message: 'Profissional Não Salvo', data: doctor}, status: :unprocessable_entity
                end
            end
            
            def update
                doctor = Doctor.find(params[:id])
                if doctor.update(doctor_params)
                    render json: {status: 'SUCCESS', message: 'Profissioanl alterado', data: doctor}, status: :ok
                else
                    render json: {status: 'ERROR', message: 'Profissional não alterado', data: doctor}, status: :unprocessable_entity
                end
            end
            
            def destroy
                doctor = Doctor.find(params[:id])
                doctor.destroy
                render json: {status: 'SUCCESS', message: 'Profissioanl apagado', data: doctor}, status: :ok
            end
            
            private
            def doctor_params
                params.permit(:fullname, :email, :CRM, :specialty_id)
            end
            
        end
    end
end
