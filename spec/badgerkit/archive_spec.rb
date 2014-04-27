require 'spec_helper'

describe Badgerkit::Archive do

  describe '.archive' do

    it 'should archive the directory and return a file' do
      file = Badgerkit::Archive.archive('spec/fixtures/archive_folder/')
      file.should be_kind_of(File)
    end

    it 'should delete the previously generated archive on second run' do
      Badgerkit::Archive.archive('spec/fixtures/archive_folder/')
      File.delete('tmp/archive_folder.zip') # Make sure we don't stub delete.
      File.should_receive(:delete).with('tmp/archive_folder.zip')
      Badgerkit::Archive.archive('spec/fixtures/archive_folder/')
    end

    it 'should contain files' do
      Badgerkit::Archive.archive('spec/fixtures/archive_folder/')

      Zip::File.open('tmp/archive_folder.zip') do |zip_file|
        entry = zip_file.glob('*.yml').first
        entry.should be_kind_of(Zip::Entry)
      end
    end

  end

end
