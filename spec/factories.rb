# frozen_string_literal: true

FactoryBot.define do
  factory(:record) do
    sequence(:name) { |n| "Record #{n}" }
  end
end
