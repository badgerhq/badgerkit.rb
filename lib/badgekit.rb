require "badgekit/version"
require "badgekit/client"

module Badgekit

  # Alias for Badgekit::Client.new
  #
  # @return [Badgekit::Client.]
  #
  def new(*args)
    @options = options
    Badgekit::Client.new(*args)
  end

end # Badgekit
