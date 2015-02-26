require 'spec_helper'

describe OxfordLearnersDictionariesController do
  describe 'GET search' do
    context 'with word' do
      it 'renders index with definitions' do
        get :index, word: "car"
        expect(OxfordLearnersDictionaries::English).to_not receive(:new)
        expect(response.status).to eq 200
      end
    end

    context 'without word' do
      it 'renders index without @oxford' do
        get :index, word: ""
        expect(OxfordLearnersDictionaries::English).to_not receive(:new)
        expect(response.status).to eq 200
      end
    end
  end
end
