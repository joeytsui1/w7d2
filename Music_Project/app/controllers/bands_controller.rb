class BandsController < ApplicationController
    # before_action :set_band

    # def set_band
    #     @band = Band.find(params[:id])
    # end

    def index
        @bands = Band.all
        render :index
    end

    def new
        @band = Band.new
        render :new
    end

    def create
        @band = Band.new(band_params)
        if @band.save
            redirect_to bands_url
        else
            redirect_to new_band_url
        end
    end
    def show
        @band = Band.find(params[:id])
        render :show
    end

    def edit
        @band = Band.find(params[:id])
        render :edit
    end

    def update
        @band = Band.find(params[:id])
        if @band.update(band_params)
            redirect_to band_url(set_band)
        else
            redirect_to edit_band_url
        end
    end

    def destroy
        @band = Band.find(params[:id])
        @band.destroy
        redirect_to bands_url
    end

    private

    def band_params
        params.require(:band).permit(:name)
    end
end