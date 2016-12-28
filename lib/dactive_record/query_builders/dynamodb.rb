module DactiveRecord
  module QueryBuilders
    class Dynamodb
      def self.build(table_name, index_name, hash_query={})
        param = {
          table_name: table_name,
          expression_attribute_values: expression_attribute_values(hash_query),
          key_condition_expression: key_condition_expression(hash_query)
        }

        param[:index_name] = index_name if index_name
        param
      end

      def self.key_condition_expression(hash_query)
        hash_query.map{|param| key_condition_param(param[0], param[1]) }.join(' and ')
      end

      def self.key_condition_param(key, value)
        value_type = value.class.name

        case value_type
        when 'Range'
          "#{key} between :#{key}_start and :#{key}_end"
        else
          "#{key} = :#{key}"
        end
      end

      def self.expression_attribute_values(hash_query)
        expression = {}

        hash_query.each do |param|
          case param[1].class.name
          when 'Range'
            expression[":#{param[0]}_start"] = param[1].first
            expression[":#{param[0]}_end"] = param[1].last
          else
            expression[":#{param[0]}"] = param[1]
          end
        end

        expression
      end

    end
  end
end
