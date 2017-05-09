require 'c80_git_bash/app'

module C80GitBash
  class << self
    def app
      @app ||= C80GitBash::App.new
    end
  end
end