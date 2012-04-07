
class Sheet::Write

  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def write
    if editor_is_set?
      Sheet.exec("#{Sheet.editor} #{Sheet.sheet_path(name)}")
    else
      Sheet.write "Please set the $EDITOR variable to write files" 
    end
  end

  private

  def editor_is_set?
    (editor = Sheet.editor) && editor.length > 0
  end
end
