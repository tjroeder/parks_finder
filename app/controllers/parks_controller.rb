class ParksController < ApplicationController
  def index
    if params[:state]
      @state = params[:state]
      @parks = ParkFacade.state_parks(@state)
    end
  end
end
