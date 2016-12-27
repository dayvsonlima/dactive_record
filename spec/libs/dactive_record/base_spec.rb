require 'spec_helper'

describe DactiveRecord::Base, type: :model do
  describe '< DactiveRecord::Base' do
    context 'when one model is intanced' do
      let(:user){ User.new(id: 'dynamic_hash') }

      [:id, :id=, :save, :valid?, :table_name].each do |method_name|
        it { expect(user).to respond_to(method_name) }
      end
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
end
