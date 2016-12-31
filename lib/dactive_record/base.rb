require 'active_model'

module DactiveRecord
  class Base
    include ActiveModel::Model
    include ActiveModel::Validations

    attr_accessor :id

    def self.find(id)
      Relation::Relation.new(self, {id: id})
    end

    def self.where(args)
      Relation::Relation.new(self, args)
    end

    def save
      return true if valid?
    end

    def self.table_name
      @@table_name ||= "#{self.name.underscore}"
    end

    def self.table_name=(table_name)
      @@table_name = table_name
    end
  end
end
