class Sheet

  class Open

    attr_accessor :name

    def initialize(name)
      @name = name
    end

    def open
      if Sheet.sheet_exists?(name)
        process_sheet_content
      else
        Sheet.write "A cheat named #{name} doesn't exist.\nYou can create one with sheet new #{name}"
      end
    end

    private

    def process_sheet_content
      if contains_url_format? && cmd = Sheet.open_command
        # TODO: check if open is available
        Sheet.exec "#{cmd} #{extract_url}"
      else
        Sheet.write sheet_content
      end
    end

    def contains_url_format?
      sheet_content.split("\n").size == 1 &&
        sheet_content =~ /^url:\s*http.+$/
    end

    def extract_url
      sheet_content.match(/(http.+)$/)[1]
    end

    def sheet_content
      @sheet_content ||= File.read(Sheet.sheet_path(name))
    end

  end
end
