class AusgabesController < ApplicationController
  before_action :set_ausgabe, only: [:show, :edit, :update, :destroy]

  # GET /ausgabes
  # GET /ausgabes.json
  def index
    @ausgabes = Pizza.where(augegeben: [false, nil], deleted: [false, nil]).order('pizzanr ASC')
  end

  def pizza_done
    pizza = Pizza.find(params['format'].to_i)
    pizza.deleted = true
    pizza.save
    redirect_to ausgabes_path
  end

end
