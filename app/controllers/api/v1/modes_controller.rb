class Api::V1::ModesController < Api::V1::ApplicationController
  def index
    @modes = Mode.all.order(:id)
    render 'jb/mode/index.json.jb'
  end
end
