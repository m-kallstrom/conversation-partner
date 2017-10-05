class TroubleWordsController < ApplicationController
  before_action :set_trouble_word, only: [:show, :edit, :update, :destroy]

  def daily_word
    # @word_and_definition = LanguageHelper.daily_word
    @word_and_definition = Switchboard.scrape_daily_word
  end

  def index
    @trouble_words = current_user.trouble_words.order(created_at: :desc).limit(10)
  end

end
