require 'spec_helper'

describe Badgerkit::Client do

  describe '#initialize' do

    it 'should be able to set options' do
      client = Badgerkit::Client.new(
        :access_token => 'some_token',
        :source       => 'github',
        :repo         => 'saladdays/badgerkit.rb',
      )
      client.access_token.should == 'some_token'
      client.source.should == 'github'
      client.repo.should == 'saladdays/badgerkit.rb'
    end

  end

  describe '#path_for' do

    it 'should return escaped path to submit to' do
      client = Badgerkit::Client.new(
        :access_token => 'some_token',
        :source       => 'github',
        :repo         => 'saladdays/badgerkit.rb',
      )
      client.path_for('(rb) roverage').should == "github/saladdays/badgerkit.rb/(rb)%20roverage"
    end

  end

  describe '#post' do

    it 'should post with correct params' do
      client = Badgerkit::Client.new(
        :access_token => 'some_token',
        :source       => 'github',
        :repo         => 'saladdays/badgerkit.rb',
      )

      HTTMultiParty.stub(:post).and_return(ResponseProxy.new)
      HTTMultiParty.should_receive(:post).with("http://badgerhq.com/github/saladdays/badgerkit.rb/Documentation",
        :body => {
          :value => {
            :value       => 90,
            :branch      => "master",
            :commit_sha1 => "0dbce1478e94053d4282ccd4ace154c82a3475d5"
          },
          :access_token => 'some_token'
        }
      )

      client.post('Documentation',
        :value       => 90,
        :branch      => 'master',
        :commit_sha1 => '0dbce1478e94053d4282ccd4ace154c82a3475d5'
      )
    end

  end

end
