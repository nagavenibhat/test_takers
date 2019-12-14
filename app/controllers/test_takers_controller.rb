class TestTakersController < ApplicationController
  before_action :set_test_taker, only: [:show, :edit, :update, :destroy]
  wrap_parameters :test_taker,include: [:data]


  # GET /test_takers
  # GET /test_takers.json
  def index
    @test_takers = TestTaker.all.page(params[:page]).per(10)
  end

  def bulk_insert
    file = FileService.new(params[:file])

    redirect_to test_takers_path, notice: 'file type not supported' and return unless file.supported_type?
    params[:test_taker]= { data: file.data_array}
    result = TestTaker.create(test_taker_params[:data])
    @notice = result.select{|e| !e.errors.empty? }.map { |e|
      {
          login: e.login,
          message: e.errors.full_messages.join(',')
      }
    }
    @notice = 'Successfully inserted' if @notice.empty?
    redirect_to test_takers_path, notice: @notice

  end

  # GET /test_takers/1
  # GET /test_takers/1.json
  def show
  end

  # GET /test_takers/new
  def new
    @test_taker = TestTaker.new
  end

  # GET /test_takers/1/edit
  def edit
  end

  # POST /test_takers
  # POST /test_takers.json
  def create
    @test_taker = TestTaker.new(test_taker_params)

    respond_to do |format|
      if @test_taker.save
        format.html { redirect_to @test_taker, notice: 'Test taker was successfully created.' }
        format.json { render :show, status: :created, location: @test_taker }
      else
        format.html { render :new }
        format.json { render json: @test_taker.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /test_takers/1
  # PATCH/PUT /test_takers/1.json
  def update
    respond_to do |format|
      if @test_taker.update(test_taker_params)
        format.html { redirect_to @test_taker, notice: 'Test taker was successfully updated.' }
        format.json { render :show, status: :ok, location: @test_taker }
      else
        format.html { render :edit }
        format.json { render json: @test_taker.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /test_takers/1
  # DELETE /test_takers/1.json
  def destroy
    @test_taker.destroy
    respond_to do |format|
      format.html { redirect_to test_takers_url, notice: 'Test taker was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test_taker
      @test_taker = TestTaker.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def test_taker_params
      params.require(:test_taker  ).permit(data: [:login, :password, :title, :lastname, :firstname, :gender, :email, :picture, :address])
    end
end
