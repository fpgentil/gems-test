class OxfordLearnersDictionariesController < ApplicationController
  def search
    word = params[:oxford_learners_dictionaries][:word]
    @oxford = OxfordLearnersDictionaries::English.new(word).look_up unless word.blank?
    render :index, status: status_oxford
  end

  private
  def status_oxford
    @oxford.nil? ? 422 : 200
  end
end
