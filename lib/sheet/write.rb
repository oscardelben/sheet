class Sheet
  class Write
    attr_accessor :name

    def initialize(name=nil)
      @name = name
    end

    def write
      return Sheet.display("Please specify a name") unless name
      create_dir_if_doesnt_exist
      if editor_is_set?
        Sheet.exec("#{Sheet.editor} #{Sheet.sheet_path(name)}", true)
      else
        Sheet.display "Please set the $EDITOR variable to write files" 
      end
    end

    private
      def editor_is_set?
        (editor = Sheet.editor) && editor.length > 0
      end

      def create_dir_if_doesnt_exist
        if ! Sheet.sheets_directory_exists?
          Dir.mkdir(Sheet.sheets_dir)
        end
      end

  end
end
