class ConversationsController < ApplicationController


  def show
  end

  # GET /conversations/main
  #This is the main page of the app that is responsible for creating a new conversation and updating it as the user types
  def new
    @sentence = Sentence.new
    current_conversation ||= @conversation = Conversation.new
  end


  # POST /conversations
  def create
    if current_conversation
      @conversation = Conversation.find(current_conversation.id)
    else
      @conversation = Conversation.create(user_id: current_user.id)
      session[:conversation_id] = @conversation.id
    end
    @sentence = Sentence.create(content: params[:sentence][:content], user: current_user, conversation: @conversation)

    LanguageHelper.sort_errors(@sentence)


    if @sentence.corrections.any?
      @final_response = @sentence.corrections[0].format_response
    else
      @final_response = LanguageHelper.watson_says(@sentence.content, current_user)
      if @final_response.nil?
        @final_response = LanguageHelper.mention_trouble_word(current_user)
      end
    end

    render :new

  end


  def destroy
    session[:conversation_id] = nil
    redirect_to new_conversation_path
  end

  # private
  #   # Use callbacks to share common setup or constraints between actions.
  #   def set_conversation
  #     @conversation = Conversation.find(params[:id])
  #   end

  #   # Never trust parameters from the scary internet, only allow the white list through.
  #   def conversation_params
  #     params.permit(:content, :user_id, :utf8, :authenticity_token, :commit)
  #   end
end
