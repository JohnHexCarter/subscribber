# frozen_string_literal: true

module Types
  class ErrorReportType < BaseObject
    field :field_name, String, null: false
    field :message, String, null: false
  end
end
