require 'spec_helper'

describe OxfordLearnersDictionariesController do
  describe 'GET search' do
    let(:doubled_word) { double :oxford, look_up: { word: 'definitions' } }

    context 'with word' do
      let(:word) { 'car' }

      context 'when word exists' do

        it 'renders index with definitions' do
          expect(OxfordLearnersDictionaries::English).to receive(:new).with(word) { doubled_word }
          get :search, oxford_learners_dictionaries: { word: word }
          expect(response.status).to eq 200
          expect(assigns(@oxford)).to be
        end
      end

      context 'when word doesnt exist' do
        let(:doubled_word) { double :oxford, look_up: nil }

        it 'renders index with definitions' do
          expect(OxfordLearnersDictionaries::English).to receive(:new).with(word) { doubled_word }
          get :search, oxford_learners_dictionaries: { word: word }
          expect(response.status).to eq 422
          expect(assigns(@oxford)["oxford"]).to be_nil
        end
      end
    end

    context 'without word' do
      let(:word) { '' }
      it 'renders index without @oxford' do
        get :search, oxford_learners_dictionaries: { word: '' }
        expect(OxfordLearnersDictionaries::English).to_not receive(:new)
        expect(response.status).to eq 422
      end
    end
  end
end
