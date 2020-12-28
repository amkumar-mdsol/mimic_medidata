require 'rails_helper'

RSpec.describe ParticipantsController, type: :controller do
  let!(:arm) { create(:arm) }

  describe '#index' do
    let!(:participants) { create_list(:participant, 10, arm_id: arm.id) }
    it 'does returns all the participants' do
      get :index, params: { arm_id: arm.id, format: 'json'}

      participants = JSON.parse(response.body)
      expect(participants.count).to eq 10
    end
  end

  describe '#create' do
    let!(:arm1) { create(:arm) }

    context 'when valid params are provided' do
      let(:valid_params) { { 
        participant: {
          name: 'Justin',
          gender: 'male',
          age: 25,
        },
        arm_id: arm.id
        }
      }

      before do
        allow(arm1).to receive_messages(name: 'another_trial_arm', limit: 40)
        allow(arm1).to receive(:limit).and_return(100)
      end
      it 'does create a participant' do
        post :create, params: valid_params

        expect(Participant.count).to eq(1)
      end
    end

    context 'when invalid params are provided' do
      let(:invalid_params) { {
        participant: {
          name: 'Prakash',
          gender: 'male',
          age: '',
        },
        arm_id: arm.id
        }
      }

      it 'does not create a participant' do
        post :create, params: invalid_params

        expect(Participant.count).to eq(0)
      end
    end
  end

  describe '#process_participant_validity' do
    it 'does call the action' do
      get :process_participant_validity
    end
  end
end




