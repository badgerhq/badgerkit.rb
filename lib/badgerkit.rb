require "badgerkit/version"
require "badgerkit/client"
require "badgerkit/archive"

##
# Ruby toolkit for the Badgerkit api.
#
module Badgerkit

  ### Class methods

  class << self

    ##
    # Alias for Badgerkit::Client.new
    #
    # @return [Badgerkit::Client]
    #
    def new(options={})
      @options = options
      Badgerkit::Client.new(options)
    end

    ##
    # Delegates to {Badgerkit::Client#post}
    #
    def post(*args)
      new.post(*args)
    end

    ##
    # Alias for {Badgerkit::Archive.archive}.
    #
    # @param directory [String] the directory to archive.
    # @return [File]
    #
    def archive(directory)
      Badgerkit::Archive.archive(directory)
    end

  end # class << self

end # Badgerkit
