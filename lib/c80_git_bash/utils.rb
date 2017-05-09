module C80GitBash
  module Utils

    CLEAR = "\e[0m"
    BOLD = "\e[1m"
    BLACK = "\e[30m"
    RED = "\e[31m"
    GREEN = "\e[32m"
    YELLOW = "\e[33m"
    BLUE = "\e[34m"
    MAGENTA = "\e[35m"
    CYAN = "\e[36m"
    WHITE = "\e[37m"

    LOG_MESSAGE_LINE_SIZE = 60
    FILENAME_PADDING = 25
    DATE_PADDING = 13

    def format_file_name(filename)
      "#{GREEN}#{filename.ljust(FILENAME_PADDING, '.')}#{CLEAR}"
    end

    # see utils_spec.rb: #format_git_message
    def format_git_message(s)

      n = LOG_MESSAGE_LINE_SIZE
      m = []

      s = s.ljust(s.size + (n - s.size % n), ' ')
      s.scan(/.{#{n}}/).each do |line|
        m << line
      end
    end

    def format_git_message_join(s)
      m = self.format_git_message(s)
      m.join("#{BLACK}\n\t#{''.ljust(FILENAME_PADDING + DATE_PADDING - 1, '.')}#{CLEAR} ")
    end

    def format_git_date(d)
      "#{BLUE}[#{d.to_s.split(' ')[0]}]#{CLEAR}"
    end

  end
end