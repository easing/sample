# frozen_string_literal: true

class CreateRecord
  def self.call(params)
    Record.create(**params)
  end
end
