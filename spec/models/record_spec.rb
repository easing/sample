# frozen_string_literal: true

# == Schema Information
#
# Table name: records
#
#  id         :integer          not null, primary key
#  name       :string           default(""), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

describe Record, type: :model do
  it { is_expected.to validate_presence_of(:name) }
end
