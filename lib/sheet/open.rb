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
      if !sheet_urls.empty? && cmd = Sheet.open_command
        # TODO: check if open is available
        sheet_urls.each do |url|
          Sheet.exec "#{cmd} #{url.chomp.gsub(/url: /,'')}"
        end
      else
        Sheet.write sheet_content
      end
    end

    def sheet_content
      @sheet_content ||= File.read(Sheet.sheet_path(name))
    end
    
    def sheet_urls
      @sheet_urls ||= sheet_content.split("\n").reject {|line| line !~ /^url:/ }
    end    
    
  end
end
