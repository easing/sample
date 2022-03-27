# frozen_string_literal: true

require 'rails_helper'

describe 'Records show', type: :request do
  let(:record) { create(:record) }

  before { get record_path(record) }

  it { expect_status :ok }
  it { expect_json_types id: :integer, name: :string }
  it { expect_json RecordSerializer.call(record) }
end
