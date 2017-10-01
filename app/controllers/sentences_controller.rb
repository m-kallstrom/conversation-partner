class SentencesController < ApplicationController

  def new
    @sentence = Sentence.new
  end


  def create

    p params
    @conversation = Conversation.find_or_create_by(user_id: params[:user_id])
    session[:conversation_id] = @conversation.id
    @sentence = Sentence.create(content: params[:content])
    @conversation.sentences << @sentence
    # @sentence.sort_errors
    user_input = @sentence.content

    if @sentence.corrections.any?
      p current_response = @sentence.corrections[0].format_response
    else
      p @final_response = LanguageHelper.watson_says(user_input, current_user)
    end

    render :new

  end

end
