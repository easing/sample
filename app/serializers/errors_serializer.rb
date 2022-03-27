# frozen_string_literal: true

class ErrorsSerializer
  def self.call(errors)
    {
      errors: errors.map { { message: _1.message, type: _1.class.name } }
    }
  end
end
