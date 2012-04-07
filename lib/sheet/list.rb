
class Sheet
  class List

    def list
      Sheet.exec("ls #{Sheet::SHEETS_DIR}")
    end
  end
end
