class WordCountController < ApplicationController
  def word_count
    @text = params.fetch("user_text").downcase
    @special_word = params.fetch("user_word").downcase

    # ================================================================================
    # Your code goes below.
    # The text the user input is in the string @text.
    # The special word the user input is in the string @special_word.
    # ================================================================================

    @word_count = @text.chomp.split(" ").length

    @character_count_with_spaces = @text.chomp.length

    @character_count_without_spaces = @text.chomp.gsub(" ", "").length

    @occurrences = @text.chomp.gsub(/[^a-z0-9\s]/i, '').split(" ").select{|n| n == @special_word}.length

    render("word_count_templates/word_count.html.erb")
  end

  def word_count_form
    render("word_count_templates/word_count_form.html.erb")
  end
end
