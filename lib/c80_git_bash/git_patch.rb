module Git
  class Lib
    def command_lines(cmd, opts=[], chdir=true, redirect = '')
      cmd_op = command(cmd, opts, chdir)
      cmd_op.split("\n")
    end
  end
end
