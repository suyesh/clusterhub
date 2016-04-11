module Supplier::TextHistoryHelper
  def check_text(text)
    if text.not_sent?
      return "Not Sent"
    else
      return "Sent"
    end
  end

  def check_text_success(text)
    if text.not_sent?
      return "warning"
    else
      return "success"
    end
  end
end
