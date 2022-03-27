# frozen_string_literal: true

class RecordsController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
  rescue_from StandardError, with: :render_error

  def index
    records = Query.new.index
    fresh_when records.maximum(:updated_at)

    render json: records
      .map(&Presenter.method(:new))
      .map(&RecordSerializer.method(:call))
  end

  def show
    record = Query.new.find(params[:id])
    render json: RecordSerializer.call(record)
  rescue ActiveRecord::RecordNotFound
    render :head, status: :not_found
  end

  def create
    contract = Contract.new(params.to_unsafe_h)
    return render json: ErrorsSerializer.call(contract.errors), status: :unprocessable_entity unless contract.valid?

    record = Presenter.new CreateRecord.call(contract.attributes)
    return render json: ErrorsSerializer.call(record.errors), status: :unprocessable_entity unless record.persisted?

    render json: RecordSerializer.call(record), status: :created, location: record
  end

  def render_error(exception)
    render json: ErrorsSerializer.call([exception]), status: :internal_server_error
  end
end
