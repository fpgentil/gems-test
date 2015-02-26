class OxfordLearnersDictionariesController < ApplicationController
  def search
    word = params[:oxford_learners_dictionaries][:word]
    if word
      @oxford = OxfordLearnersDictionaries::English.new(word)
      @oxford.look_up
    end
    render :index
  end
end
