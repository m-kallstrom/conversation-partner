class TroubleWordsController < ApplicationController
  before_action :set_trouble_word, only: [:show, :edit, :update, :destroy]

  # GET /trouble_words
  # GET /trouble_words.json
  def index
    @trouble_words = TroubleWord.all
  end

  # GET /trouble_words/1
  # GET /trouble_words/1.json
  def show
  end

  # GET /trouble_words/new
  def new
    @trouble_word = TroubleWord.new
  end

  # GET /trouble_words/1/edit
  def edit
  end

  # POST /trouble_words
  # POST /trouble_words.json
  def create
    @trouble_word = TroubleWord.new(trouble_word_params)

    respond_to do |format|
      if @trouble_word.save
        format.html { redirect_to @trouble_word, notice: 'Trouble word was successfully created.' }
        format.json { render :show, status: :created, location: @trouble_word }
      else
        format.html { render :new }
        format.json { render json: @trouble_word.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trouble_words/1
  # PATCH/PUT /trouble_words/1.json
  def update
    respond_to do |format|
      if @trouble_word.update(trouble_word_params)
        format.html { redirect_to @trouble_word, notice: 'Trouble word was successfully updated.' }
        format.json { render :show, status: :ok, location: @trouble_word }
      else
        format.html { render :edit }
        format.json { render json: @trouble_word.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trouble_words/1
  # DELETE /trouble_words/1.json
  def destroy
    @trouble_word.destroy
    respond_to do |format|
      format.html { redirect_to trouble_words_url, notice: 'Trouble word was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trouble_word
      @trouble_word = TroubleWord.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def trouble_word_params
      params.require(:trouble_word).permit(:word, :user_id, :conversation_id)
    end
end
