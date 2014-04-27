module Badgerkit
  class Archive
    require 'rubygems'
    require 'zip'

    class << self

      ##
      # Archives a directory.
      #
      # @param directory [String] the directory to zip.
      # @return [File]
      #
      def archive(directory)
        filename = "tmp/#{directory.split('/').last}.zip"

        File.delete(filename) rescue nil # Make sure there's not already an archive

        ## Zip the directory
        Zip::File.open(filename, Zip::File::CREATE) do |zipfile|
          Dir[File.join(directory, '**', '**')].each do |file|
            zipfile.add(file.sub(directory, ''), file)
          end
        end

        ## Return the newly archived directory
        File.new(filename)
      end

    end # class << self

  end # Archive
end # Badgerkit
