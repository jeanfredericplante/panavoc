module HomeHelper
  def display_voc(word)
    begin
      if (word["partofspeech"] && word["definition"])
        word_view= word["partofspeech"] + ":"+ word["definition"]
      else
        word_view = "no def found"
      end
    rescue
      logger.info($!.to_s)
      logger.info($!.backtrace.join("\n"))
      word_view = "no def found"
    end
  return word_view
  end
end
