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
class RecordSerializer
  def self.call(record)
    record = Presenter.new(record)

    {
      id: record.id,
      name: record.full_name
    }
  end
end
