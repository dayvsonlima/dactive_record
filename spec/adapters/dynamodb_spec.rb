require  'spec_helper'

context DactiveRecord::Adapters::Dynamodb, type: :adapter do

  context 'class_methods' do
    [:query].each do |method|
      it {  expect(described_class).to respond_to(method) }
    end
  end

  context 'instance_methods' do
    let(:described_instance_class) { described_class.new }

    [].each do |method|
      it {  expect(described_instance_class).to respond_to(method) }
    end
  end
end
