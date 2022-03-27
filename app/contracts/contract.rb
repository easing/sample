# frozen_string_literal: true

class Contract
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :name, type: String, default: ''

  validates_presence_of :name

  def initialize(params = {})
    super params.slice(*self.class.attribute_names)
  end
end
