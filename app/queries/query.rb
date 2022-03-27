# frozen_string_literal: true

class Query
  def scope = Record.all
  alias index scope
  delegate :find, to: :scope
end
