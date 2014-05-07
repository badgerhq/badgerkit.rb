module Badgerkit
  # Custom error class for rescuing from all Badgerkit errors
  class Error < StandardError

    # Returns the appropriate Badgerkit::Error sublcass based
    # on status and response message
    #
    # @param response [Hashie::Mash] response HTTP response
    # @return [Badgerkit::Error]
    #
    def self.from_response(response)
      status  = response[:status].to_i
      body    = response[:body].to_s
      headers = response[:response_headers]

      if klass =  case status
                  when 400      then Octokit::BadRequest
                  when 401      then error_for_401(headers)
                  when 403      then error_for_403(body)
                  when 404      then Octokit::NotFound
                  when 406      then Octokit::NotAcceptable
                  when 409      then Octokit::Conflict
                  when 415      then Octokit::UnsupportedMediaType
                  when 422      then Octokit::UnprocessableEntity
                  when 400..499 then Octokit::ClientError
                  when 500      then Octokit::InternalServerError
                  when 501      then Octokit::NotImplemented
                  when 502      then Octokit::BadGateway
                  when 503      then Octokit::ServiceUnavailable
                  when 500..599 then Octokit::ServerError
                  end
        klass.new(response)
      end
    end

  end # Error

  # Raised on errors in the 400-499 range
  class ClientError < Error; end

  # Raised when Badgerhq returns a 400 HTTP status code
  class BadRequest < ClientError; end

  # Raised when Badgerhq returns a 401 HTTP status code
  class Unauthorized < ClientError; end

  # Raised when Badgerhq returns a 403 HTTP status code
  class Forbidden < ClientError; end

  # Raised when Badgerhq returns a 404 HTTP status code
  class NotFound < ClientError; end

  # Raised when Badgerhq returns a 406 HTTP status code
  class NotAcceptable < ClientError; end

  # Raised when Badgerhq returns a 409 HTTP status code
  class Conflict < ClientError; end

  # Raised when Badgerhq returns a 422 HTTP status code
  class UnprocessableEntity < ClientError; end

  # Raised on errors in the 500-599 range
  class ServerError < Error; end

  # Raised when Badgerhq returns a 500 HTTP status code
  class InternalServerError < ServerError; end

  # Raised when Badgerhq returns a 502 HTTP status code
  class BadGateway < ServerError; end

  # Raised when Badgerhq returns a 503 HTTP status code
  class ServiceUnavailable < ServerError; end

  # Raised when a method requires an application client_id
  # and secret but none is provided
  class ApplicationCredentialsRequired < StandardError; end
end # Badgerkit
