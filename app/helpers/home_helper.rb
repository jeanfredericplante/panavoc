module HomeHelper
  def display_voc(word)
    begin
      if (word["partofspeech"] && word["definition"])
        word_view= word["partofspeech"] + ": "+ word["definition"]
      else
        word_view = ""
      end
    rescue
      logger.info($!.to_s)
      logger.info($!.backtrace.join("\n"))
      word_view = "NA"
    end
  return word_view
  end
  

end
