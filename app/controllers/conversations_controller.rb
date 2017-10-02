class ConversationsController < ApplicationController

  def history
    @conversation = Conversation.find(params[:id])
    render :show
  end

  def show
  end

  def new
    @sentence = Sentence.new
    current_conversation ||= @conversation = Conversation.new
  end

  # POST /conversations
  def create
    if current_conversation
      @conversation = Conversation.find(current_conversation.id)
    else
      if current_user
        @conversation = Conversation.create(user_id: current_user.id)
      else
        @conversation = Conversation.create
      end
      session[:conversation_id] = @conversation.id
    end
    @sentence = Sentence.create(content: params[:sentence][:content], user: current_user, conversation: @conversation)

    LanguageHelper.sort_errors(@sentence)

    @final_response = LanguageHelper.process_response(@sentence, current_user)
    @sentence.response = @final_response

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


    # if @sentence.corrections.any?
    #   @final_response = @sentence.corrections[0].format_response
    # else
    #   @final_response = LanguageHelper.watson_says(@sentence.content, current_user)
    #   if @final_response.nil?
    #     @final_response = LanguageHelper.mention_trouble_word(current_user)
    #   end
    # end
