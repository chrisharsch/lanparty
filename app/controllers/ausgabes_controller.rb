class AusgabesController < ApplicationController
  before_action :set_ausgabe, only: [:show, :edit, :update, :destroy]

  # GET /ausgabes
  # GET /ausgabes.json
  def index
    @ausgabes = Pizza.where(augegeben: [false, nil], deleted: [false, nil]).order('pizzanr ASC')
  end

  # GET /ausgabes/1
  # GET /ausgabes/1.json
  def show
  end

  # GET /ausgabes/new
  def new
    @ausgabe = Pizza.new
  end

  # GET /ausgabes/1/edit
  def edit
  end

  # POST /ausgabes
  # POST /ausgabes.json
  def create
    @ausgabe = Pizza.new(ausgabe_params)

    respond_to do |format|
      if @ausgabe.save
        format.html {redirect_to @ausgabe, notice: 'Ausgabe was successfully created.'}
        format.json {render :show, status: :created, location: @ausgabe}
      else
        format.html {render :new}
        format.json {render json: @ausgabe.errors, status: :unprocessable_entity}
      end
    end
  end

  # PATCH/PUT /ausgabes/1
  # PATCH/PUT /ausgabes/1.json
  def update
    respond_to do |format|
      if @ausgabe.update(ausgabe_params)
        format.html {redirect_to @ausgabe, notice: 'Ausgabe was successfully updated.'}
        format.json {render :show, status: :ok, location: @ausgabe}
      else
        format.html {render :edit}
        format.json {render json: @ausgabe.errors, status: :unprocessable_entity}
      end
    end
  end

  # DELETE /ausgabes/1
  # DELETE /ausgabes/1.json
  def destroy
    @ausgabe.destroy
    respond_to do |format|
      format.html {redirect_to ausgabes_url, notice: 'Ausgabe was successfully destroyed.'}
      format.json {head :no_content}
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_ausgabe
    @ausgabe = Pizza.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def ausgabe_params
    params.fetch(:ausgabe, {})
  end
end
