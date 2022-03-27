# frozen_string_literal: true

require 'rails_helper'

describe 'Records index', type: :request do
  let(:record) { create(:record) }

  before { get records_path }

  it { expect_status(:ok) }
  it { expect_json_types :array }
  it { expect_json_types '?', id: :integer, name: :string }
end
