class TroubleWordsController < ApplicationController
  before_action :set_trouble_word, only: [:show, :edit, :update, :destroy]

  def daily_word
    @word_and_definition = LanguageHelper.daily_word
  end

  def index
    @trouble_words = current_user.trouble_words
  end

end
