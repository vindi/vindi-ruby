module Vindi
  # Custom error class for rescuing from all Vindi errors
  class Error < StandardError
    attr_accessor :status_code

    # Raised when Vindi returns a 4xx HTTP status code
    ClientError = Class.new(self)

    # Raised when Vindi returns the HTTP status code 400
    BadRequest = Class.new(ClientError)

    # Raised when Vindi returns the HTTP status code 401
    Unauthorized = Class.new(ClientError)

    # Raised when Vindi returns the HTTP status code 403
    Forbidden = Class.new(ClientError)

    # Raised when Vindi returns the HTTP status code 404
    NotFound = Class.new(ClientError)

    # Raised when Vindi returns the HTTP status code 406
    NotAcceptable = Class.new(ClientError)

    # Raised when Vindi returns the HTTP status code 422
    UnprocessableEntity = Class.new(ClientError)

    # Raised when Vindi returns the HTTP status code 429
    TooManyRequests = Class.new(ClientError)

    # Raised when Vindi returns a 5xx HTTP status code
    ServerError = Class.new(self)

    # Raised when Vindi returns the HTTP status code 500
    InternalServerError = Class.new(ServerError)

    # Raised when Vindi returns the HTTP status code 502
    BadGateway = Class.new(ServerError)

    # Raised when Vindi returns the HTTP status code 503
    ServiceUnavailable = Class.new(ServerError)

    # Raised when Vindi returns the HTTP status code 504
    GatewayTimeout = Class.new(ServerError)

    class << self
      def from_response(response)
        status = response.status.to_i

        klass = case status
                when 400      then Vindi::Error::BadRequest
                when 401      then Vindi::Error::Unauthorized
                when 403      then Vindi::Error::Forbidden
                when 404      then Vindi::Error::NotFound
                when 406      then Vindi::Error::NotAcceptable
                when 415      then Vindi::Error::UnsupportedMediaType
                when 422      then Vindi::Error::UnprocessableEntity
                when 429      then Vindi::Error::TooManyRequests
                when 400..499 then Vindi::Error::ClientError
                when 500      then Vindi::Error::InternalServerError
                when 502      then Vindi::Error::BadGateway
                when 503      then Vindi::Error::ServiceUnavailable
                when 504      then Vindi::Error::GatewayTimeout
                when 500..599 then Vindi::Error::ServerError
                end

        klass.new(response) if klass
      end
    end

    def initialize(response)
      super(build_error_message(response))
    end

    def build_error_message(response)
      return unless response&.body

      self.status_code = response.status

      response.body
    end
  end
end
