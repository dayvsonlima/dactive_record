require 'spec_helper'

RSpec.describe DactiveRecord::QueryBuilders::Dynamodb, type: :lib do
  let(:query_hash) do
    {id: 1, created_at: 0..1}
  end

  describe '.build' do
    subject do
      {
        :table_name=>'my_table',
        :index_name=>'my_index',
        :expression_attribute_values=>{':id'=>2, ':created_at_start'=>1, ':created_at_end'=>4},
        :key_condition_expression=> 'id = :id and created_at between :created_at_start and :created_at_end'
      }
    end

    let(:builder_example) do
      described_class.build('my_table', 'my_index', {id: 2, created_at: 1..4})
    end

    it { expect(builder_example).to eq(subject) }
  end

  describe '.key_condition_param' do
    context 'when value typeof is string' do
      subject { 'id = :id' }

      it 'return one string with equal operator' do
        expect(described_class.key_condition_param(:id, 'value')).to eq(subject)
      end
    end

    context 'when value typeof is one range' do
      subject { 'id between :id_start and :id_end' }

      it 'return one string with between operator' do
        expect(described_class.key_condition_param(:id, 1..3)).to eq(subject)
      end
    end
  end

  describe '.key_condition_expression' do
    subject { 'id = :id and created_at between :created_at_start and :created_at_end' }

    let(:key_condition_expression) do
      described_class.key_condition_expression(query_hash)
    end

    it do
      expect(key_condition_expression).to eq(subject)
    end
  end

  describe '.expression_attribute_values' do
    subject { {':id'=>1, ':created_at_start'=>0, ':created_at_end'=>1} }

    let(:expression_attribute_values) { described_class.expression_attribute_values(query_hash) }

    it do
      expect(expression_attribute_values).to eq(subject)
    end
  end
end
