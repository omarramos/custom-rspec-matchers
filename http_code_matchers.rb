module HttpCodeMatchers
  class StatusCode

    def initialize(expected)
      @expected = expected
    end

    def matches?(actual)
      @actual = actual
      sym_status_to_s(@expected) == actual
    end

    def failure_message
      "expected #{sym_status_to_s(@expected)} but got '#{@actual}'"
    end

    def negative_failure_message
      "expected something else than #{sym_status_to_s(@expected)} but got '#{@actual}'"
    end

    private
    def sym_status_to_s(status)
      Rack::Utils.status_code(status).to_s
    end
  end

  def have_status_code(expected)
    StatusCode.new(expected)
  end
end
