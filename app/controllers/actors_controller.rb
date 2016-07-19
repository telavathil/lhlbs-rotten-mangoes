class ActorsController < ApplicationController
  before_action :set_actor, only: [:show, :edit, :update, :destroy]
  before_action :load_movie, only: [:new, :create, :edit, :destroy]

  # GET /actors
  # GET /actors.json
  def index
    @actors = @movie.actors
  end

  # GET /actors/1
  # GET /actors/1.json
  def show
  end

  # GET /actors/new
  def new
    @actor = @movie.actors.new

  end

  # GET /actors/1/edit
  def edit
  end

  # POST /actors
  # POST /actors.json
  def create
    # binding.pry
    @actor = @movie.actors.new(actor_params)

    respond_to do |format|
      if @actor.save
        format.html { redirect_to @actor, notice: 'Actor was successfully created.' }
        format.json { render :show, status: :created, location: @actor }
      else
        format.html { render :new }
        format.json { render json: @actor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /actors/1
  # PATCH/PUT /actors/1.json
  def update
    respond_to do |format|
      if @actor.update(actor_params)
        format.html { redirect_to @actor, notice: 'Actor was successfully updated.' }
        format.json { render :show, status: :ok, location: @actor }
      else
        format.html { render :edit }
        format.json { render json: @actor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /actors/1
  # DELETE /actors/1.json
  def destroy
    @actor.destroy
    respond_to do |format|
      format.html { redirect_to actors_url, notice: 'Actor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  protected
  def load_movie
    @movie = Movie.find(params[:movie_id])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_actor
      @actor = Actor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def actor_params
      params.require(:actor).permit(:firstname, :lastname, :movie_id)
    end

    def set_movie
      @movie = Movie.find(params[:movie_id])
    end
end
