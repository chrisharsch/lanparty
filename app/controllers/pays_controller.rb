class PaysController < ApplicationController
  before_action :set_pay, only: [:show, :edit, :update, :destroy]

  # GET /pays
  # GET /pays.json
  def index
    @pays = Pizza.where(bezahlt: [false, nil])
  end

  def pizza_done
    pizza = Pizza.find(params['format'].to_i)
    pizza.bezahlt = true
    pizza.save
    redirect_to pays_path
  end
end