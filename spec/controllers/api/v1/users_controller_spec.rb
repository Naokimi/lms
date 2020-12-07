require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :controller do
  let(:user)            { FactoryBot.create(:user) }
  let(:token_requester) { double(TokenRequester) }

  describe '#create' do
    before do
      allow(TokenRequester).to receive(:new).and_return(token_requester)
      allow(token_requester).to receive(:call).and_return('token123')
    end

    context 'success' do
      it 'creates a new basic user' do
        post :create, params: { email: 'test@test.com', first_name: 'test', last_name: 'test' }, format: :json
        expect(response).to have_http_status(201)
        new_user = User.last
        expect(new_user.email).to eq('test@test.com')
        expect(new_user.token).to eq('token123')
      end
    end

    context 'failure' do
      it 'renders the error' do
        post :create, params: { email: 'test@test.com' }, format: :json
        expect(response).to have_http_status(500)
        expect(JSON.parse(response.body)).to eq("Validation failed: First name can't be blank, Last name can't be blank")
      end
    end
  end

  describe '#login' do
    let(:new_token) { 'newtoken123' }

    before do
      allow(TokenRequester).to receive(:new).and_return(token_requester)
      allow(token_requester).to receive(:call).and_return(new_token)
    end

    it 'updates the token' do
      patch :login, params: { id: user.id }, format: :json
      expect(response).to have_http_status(200)
      expect(User.find(user.id).token).to eq(new_token)
    end
  end

  describe '#promote_to_admin' do
    it 'upgrades user to admin' do
      patch :promote_to_admin, params: { id: user.id }, format: :json
      expect(response).to have_http_status(200)
      expect(User.find(user.id).admin).to eq(true)
    end
  end

  describe '#upgrade_to_premium' do
    it 'upgrades user to premium' do
      patch :upgrade_to_premium, params: { id: user.id }, format: :json
      expect(response).to have_http_status(200)
      expect(User.find(user.id).subscription).to eq(1)
    end
  end

  describe '#upgrade_to_professional' do
    it 'upgrades user to professional' do
      patch :upgrade_to_professional, params: { id: user.id }, format: :json
      expect(response).to have_http_status(200)
      expect(User.find(user.id).subscription).to eq(2)
    end
  end
end
