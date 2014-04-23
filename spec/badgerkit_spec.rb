require 'spec_helper'

describe Badgerkit do

  subject { Badgerkit.new }

  describe '.new' do

    it 'is a Badgerkit::Client' do
      expect(subject).to be_a Badgerkit::Client
    end

  end

  describe '.post' do

    it 'should delegate to Badgerkit::Client#post' do
      HTTParty.stub(:post).and_return({})

      Badgerkit::Client.any_instance.should_receive(:post).with('Documenation', :value => 9)

      Badgerkit.post('Documenation', :value => 9)
    end

  end

end
