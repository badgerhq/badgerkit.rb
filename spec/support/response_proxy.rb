# @private
class ResponseProxy

  attr_reader :parsed_response

  def initialize(attributes={})
    @parsed_response = attributes
  end

end
