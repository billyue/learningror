class StateController < ApplicationController
  def filter
    @states_arr = State.filter(params[:substring])
  end
end