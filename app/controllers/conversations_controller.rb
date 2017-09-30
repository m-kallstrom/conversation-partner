class ConversationsController < ApplicationController

  # GET /conversations/1
  # GET /conversations/1.json
  def show
  end

  # GET /conversations/main
  #This is the main page of the app that is responsible for creating a new conversation and updating it as the user types
  def new
    @conversation = Conversation.new
  end


  # POST /conversations
  # POST /conversations.json
  def create
    @conversation = Conversation.find_or_create_by(user_id: conversation_params[:user_id])
    session[:conversation_id] = @conversation.id
    @sentence = Sentence.create(content: conversation_params[:content])
    @conversation.sentences << @sentence
    @sentence.sort_errors
    user_input = @sentence.content




    if @sentence.corrections.any?
      p current_response = @sentence.corrections[0].format_response
    else
      p @final_response = LanguageHelper.watson_says(user_input, current_user)
    end


    render :new

    # respond_to do |format|
    #   if @conversation.save
    #     format.html { redirect_to @conversation, notice: 'Conversation was successfully created.' }
    #     format.json { render :show, status: :created, location: @conversation }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @conversation.errors, status: :unprocessable_entity }
    #   end
    # end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_conversation
      @conversation = Conversation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def conversation_params
      params.permit(:content, :user_id, :utf8, :authenticity_token, :commit)
    end
end
