module Api
  module V1
    class AirlinesController < ApplicationController
      protect_from_forgery with: :null_session

      def index
        airlines = Airline.all.order(popularity: :desc)
        count_by_country = Airline.group(:country).count
        popular_airlines = Airline.popular

        puts "--------------------------------------#{count_by_country}"
        puts "--------------------------------------#{popular_airlines}"

        render json: AirlineSerializer.new(airlines, options).serialized_json
      end

      def show
        airline = Airline.find_by(slug: params[:slug])

        render json: AirlineSerializer.new(airline, options).serialized_json
      end

      def create
        airline = Airline.new(airline_params)

        puts "=========PARAMS::::::#{airline_params}"

        if airline.save
          AirlineMailer.send_email.deliver_later
          render json: AirlineSerializer.new(airline).serialized_json
        else
          puts "----------------ERROR___#{airline.errors.messages}"
          render json: { error: airline.errors.messages }, status: 422
        end
      end

      def update
        airline = Airline.find_by(slug: params[:slug])

        if airline.update(airline_params)
          render json: AirlineSerializer.new(airline, options).serialized_json
        else
          render json: { error: airline.errors.messages }, status: 422
        end
      end

      def destroy
        airline = Airline.find_by(slug: params[:slug])

        if airline.destroy
          head :no_content
        else
          render json: { error: airline.errors.messages }, status: 422
        end
      end

      def by_country
        by_country = Airline.group(:country).count

        render json: by_country
      end

      def search
        search = Airline.where('name LIKE ? OR slug LIKE ?', "%#{params[:query]}%", "%#{params[:query]}%")
        
        render json: AirlineSerializer.new(search, options).serialized_json
      end

      private

      def airline_params
        params.require(:airline).permit(:name, :image_url, :user_id)
      end

      def options
        @options ||= { include: %i[reviews] }
      end

    end
  end
end