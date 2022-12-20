class BandsController < ApplicationController
    before_action :set_band

    def set_band
        @band = Band.find(params[:id])
    end

    def index
        @bands = Band.all
        render json: @bands
    end

    def show
        set_band
        render :show
    end

    def edit
        set_band
        render :edit
    end

    def update
        if set_band.update(band_params)
            redirect_to band_url(set_band)
        else
            redirect_to edit_band_url
        end
    end

    def destroy
        set_band.destroy
        redirect_to bands_url
    end

    private

    def band_params
        params.require(:band).require(:name)
    end
end