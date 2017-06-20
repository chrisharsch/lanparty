class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    @pizzas = Pizza.all
    pizzanumbers = Array.new(@pizzas.length)
    i = 0
    @pizzas.each do |pizza|
      unless pizzanumbers.include?(pizza.pizzanr)
        pizzanumbers[i] = pizza.pizzanr
      end
      i = i + 1
    end
    p pizzanumbers
    pizzanumbers.sort { |a,b| a.to_i <=> b.to_i }
    @pizzas_small = Array.new(i)
    @pizzas_large = Array.new(i)
    i = 0
    j = 0
    pizzanumbers.each do |number|
      unless number.nil?
        unless Pizza.where(pizzanr: number, grosse: false).first.nil?
          @pizzas_small[i] = Pizza.where(pizzanr: number, grosse: false).select("pizzanr").first.pizzanr
          i = i + 1
        end
        unless Pizza.where(pizzanr: number, grosse: true).first.nil?
          @pizzas_large[j] = Pizza.where(pizzanr: number, grosse: true).select("pizzanr").first.pizzanr
          j = j + 1
        end
      end

    end
  end
end
