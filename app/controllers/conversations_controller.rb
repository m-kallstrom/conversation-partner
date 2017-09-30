class ConversationsController < ApplicationController
  before_action :set_conversation, only: [:show, :edit, :update, :destroy]


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
    @conversation = Conversation.find_or_create_by(conversation_params)
    @sentence = Sentence.create(content: conversation_params[:content])
    @conversation.sentences << @sentence
    @sentence.sort_errors
    user_input = @sentence.content

    @final_response = LanguageHelper.craft_response(user_input, current_user)
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
      params.require(:conversation).permit(:content, :user_id)
    end
end
