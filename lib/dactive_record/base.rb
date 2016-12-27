require 'active_model'

module DactiveRecord
  class Base
    include ActiveModel::Model
    include ActiveModel::Validations

    attr_accessor :id
    attr_accessor :table_name

    def save
      return true if valid?
    end
  end
end
