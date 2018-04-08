class PointsController < ApplicationController

  def index
    @points = Point.where.not(latitude: nil, longitude: nil)

    @markers = @points.map do |point|
      {
        lat: point.latitude,
        lng: point.longitude#,
        # infoWindow: { content: render_to_string(partial: "/flats/map_box", locals: { flat: flat }) }
      }
    end
  end

  def show
    @point = Point.find(params[:id])

    @markers = [{lat: @point.latitude, lng: @point.longitude}]
  end

end
