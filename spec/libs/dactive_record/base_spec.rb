require 'spec_helper'

describe DactiveRecord::Base, type: :model do
  describe '< DactiveRecord::Base' do
    context 'when one model is intanced' do
      let(:user) { User.new(id: 'dynamic_hash') }

      [:id, :id=, :save, :valid?].each do |method_name|
        it { expect(user).to respond_to(method_name) }
      end
    end

    context 'Class methods' do
      let(:user) { User }

      [:table_name, :table_name=].each do |method_name|
        it { expect(user).to respond_to(method_name) }
      end

      it { expect(user.table_name).to eq('user') }
    end
  end

  describe '#table_name' do
    context 'when table_name is setted' do
      let(:user) { User }

      before do
        user.table_name = 'my_table_name'
      end

      it { expect(user.table_name).to eq('my_table_name') }
    end
  end

  describe '#save' do
    context 'when is invalid' do
      let(:user) { User.new }

      it { expect(user.save).to be_nil }
      it { user.save }
    end

    context 'when is valid' do
      let(:user) { User.new(id: 123) }

      it { expect(user.save).to be_truthy }
    end
  end

  describe '.where' do
    let(:relation_instance) { User.where(id: 'some_id') }

    subject(:class_type) { DactiveRecord::Relation::Relation }

    subject(:hash_query) { {id: 'some_id'} }

    it { expect(relation_instance.class).to eq(class_type) }

    it { expect(relation_instance.hash_query).to eq(hash_query) }
    it { expect(relation_instance.relationable).to eq(User) }
  end
end
