require 'active_model'

module DactiveRecord
  class Base
    include ActiveModel::Model
    include ActiveModel::Validations

    attr_accessor :id

    def save
      return true if valid?
    end

    def self.table_name
      @@table_name ||= "#{self.name.underscore}"
    end

    def self.table_name=(t_name)
      @@table_name = t_name
    end
  end
end
