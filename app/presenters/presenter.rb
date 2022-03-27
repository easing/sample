# frozen_string_literal: true

class Presenter
  attr_reader :record

  def initialize(record)
    @record = record
  end

  delegate_missing_to :record

  def name
    "#{record.name} — #{record.id}"
  end
end
