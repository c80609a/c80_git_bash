module C80GitBash

  class App

    include C80GitBash::Utils

    def run
      exe ARGV[0]
    end

    def exe(master_pwd)

      # соберём имена файлов, отсортируем
      filenames = []
      Dir.foreach(master_pwd) { |f| filenames << f }
      filenames.sort!

      # обойдём то, что собрали
      filenames.each do |filename|
        # пропустим ненужное
        next if filename == '.' || filename == '..'

        # соберём полный путь
        full_filename = File.join(master_pwd, filename)

        # зайдём в каждую директорию
        if File.directory?(full_filename)
          r = "======[ #{full_filename} ]".ljust(130, '=')
          puts "\n\n#{r}\n\n"
          self.get_log(full_filename)
        end

      end


    end

    def get_log(pwd)

      # соберём и отсортируем имена файлов по текущему пути
      filenames = []
      Dir.foreach(pwd) {|f| filenames << f}
      filenames.sort!

      #обходим каждый файл текущего пути
      filenames.each do |filename|

        # лабаем имя директории
        d = File.join(pwd, filename)
        next if filename == '.' || filename == '..'

        # выбираем только директории
        if File.directory?(d)

          # имя директории
          f = format_file_name(filename)

          # noinspection RubyEmptyRescueBlockInspection
          begin
            g = Git.open(d)
            log_last = g.log.last

            d = format_git_date(log_last.date)
            m = format_git_message_join(log_last.message)


            puts "\t#{f}#{d} #{m}"
          rescue Git::GitExecuteError
            puts "\t#{f}[#{''.ljust(10,'-')}] #{RED}GitExecuteError#{CLEAR}"
          rescue ArgumentError
          end

        end

      end

    end

  end
end