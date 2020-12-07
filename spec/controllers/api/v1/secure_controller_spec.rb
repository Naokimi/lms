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
    end

    context 'success' do
      before do
        allow(AuthorizationService).to receive(:new).and_return(authorization_service)
        allow(authorization_service).to receive(:authenticate_request!)
      end

      it 'authorizes action' do
        get :index, format: :json
        expect(AuthorizationService).to have_received(:new)
        expect(authorization_service).to have_received(:authenticate_request!)
      end
    end
  end
end
