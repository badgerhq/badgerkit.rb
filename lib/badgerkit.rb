require "badgerkit/version"
require "badgerkit/client"

module Badgerkit

  ### Class methods

  class << self

    # Alias for Badgerkit::Client.new
    #
    # @return [Badgerkit::Client.]
    #
    def new(options={})
      @options = options
      Badgerkit::Client.new(options)
    end

  end # class << self

end # Badgerkit
