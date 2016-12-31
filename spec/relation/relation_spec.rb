require 'spec_helper'

context DactiveRecord::Relation::Relation, type: :relation do

  describe 'instance_methods' do
    let(:relation) { described_class.new(User, {}) }

    [:query].each do |method_name|
      it { expect(relation).to respond_to(method_name) }
    end
  end
end
