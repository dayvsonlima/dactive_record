module DactiveRecord
  module Relation
    class Relation
      attr_accessor :relationable
      attr_accessor :hash_query

      def initialize(relationable, hash_query={})
        @hash_query   = hash_query
        @relationable = relationable
      end

      def query(*args)
      end
    end
  end
end
