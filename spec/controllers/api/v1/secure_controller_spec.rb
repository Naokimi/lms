require 'rails_helper'

RSpec.describe Api::V1::SecureController, type: :controller do
  let(:user) { FactoryBot.create(:user) }

  describe '#authorize_request' do
    controller do
      skip_before_action :set_raven_context

      def index; end
    end

    let(:authorization_service) { double(AuthorizationService) }

    before do
      request.headers['Authorization'] = "Bearer #{user.token}"
      allow(AuthorizationService).to receive(:new).and_return(authorization_service)
    end

    context 'success' do
      before do
        allow(authorization_service).to receive(:authenticate_request!)
      end

      it 'authorizes action' do
        get :index, format: :json
        expect(response).to have_http_status(204)
        expect(AuthorizationService).to have_received(:new)
        expect(authorization_service).to have_received(:authenticate_request!)
      end
    end

    context 'failure' do
      before do
        allow(authorization_service).to receive(:authenticate_request!).and_raise(JWT::DecodeError)
      end

      it 'removes token and renders unauthorized' do
        get :index, format: :json
        expect(response).to have_http_status(:unauthorized)
        expect(AuthorizationService).to have_received(:new)
        expect(authorization_service).to have_received(:authenticate_request!)
        expect(User.find(user.id).token).to eq(nil)
      end
    end
  end
end
