class ConversationsController < ApplicationController

  def history
    @conversation = Conversation.find_by(id: params[:id])
    render :show
  end

  def show
  end

  def new

    @sentence = Sentence.new
     if current_conversation
      @conversation = Conversation.find(current_conversation.id)
    else
      if current_user
        @conversation = Conversation.create(user_id: current_user.id)
      else
        @conversation = Conversation.create
      end
      Switchboard.watson_init(current_user)
      session[:conversation_id] = @conversation.id
    end

  end

  # POST /conversations
  def create
    @conversation = Conversation.find(current_conversation.id)
    @sentence = Sentence.create(sentence_params)
    @sentence.user = current_user
    @sentence.conversation = @conversation

    LanguageHelper.sort_errors(@sentence)

    @final_response = LanguageHelper.process_response(@sentence, current_user)
    @sentence.response = @final_response
    @sentence.save

    if request.xhr?
      render partial: "partials/response", layout: false, locals: {sentence: @sentence }
    else
      render :new
    end
  end


  def destroy
    session[:conversation_id] = nil
    redirect_to new_conversation_path
  end

  private
    def sentence_params
      params.require(:sentence).permit(:content)
    end

end
