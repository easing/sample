# frozen_string_literal: true

require 'rails_helper'

describe 'Records show', type: :request do
  before { post records_path, params: }

  context 'with valid params' do
    let(:params) { { name: SecureRandom.hex } }

    it { expect_status :created }
    it { expect(response.location).to eq(record_url(Record.last)) }
  end

  context 'with invalid params' do
    let(:params) { { name: '' } }

    it { expect_status :unprocessable_entity }
    it { expect_json_types errors: :array_of_objects }
    it { expect_json_types 'errors.?', message: :string, type: :string }
  end
end
