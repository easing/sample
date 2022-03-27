# frozen_string_literal: true

require 'rails_helper'

describe RecordsController, type: :controller do
  describe '#index' do
    subject { get :index }

    it { is_expected.to have_http_status(:ok) }
  end

  describe '#create' do
    subject! { post :create, params: params}

    context 'when params valid' do
      let(:params) { { name: SecureRandom.hex } }

      it { is_expected.to have_http_status(:created) }
      it { expect(response.location).to eq(record_url(Record.last.id)) }
    end

    context 'when params invalid' do
      let(:params) { { name: '' } }

      it { is_expected.to have_http_status(:unprocessable_entity) }
    end
  end

  describe '#show' do
    subject { get :show, params: { id: } }

    context 'when existing record queried' do
      let(:id) { create(:record).id }

      it { is_expected.to have_http_status(:ok) }
    end

    context 'when missed record queried' do
      let(:id) { 0 }

      it { is_expected.to have_http_status(:not_found) }
    end
  end
end
