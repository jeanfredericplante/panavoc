module VocentriesHelper
  def use_tinymce
      @content_for_tinymce = "" 
      content_for :tinymce do
        javascript_include_tag "tiny_mce/tiny_mce"
      end
      @content_for_tinymce_init = "" 
      content_for :tinymce_init do
        javascript_include_tag "mce_editor"
      end
  end

  def hash_to_html key,value
     if value.nil?
       puts "<li>#{key}</li>"
     elsif value.is_a?(Hash)
       puts "<li>#{key}"
       puts "<ul>"
       value.each(&method(:hash_to_html))
       puts "</ul></li>"
     else
       fail "I don't know what to do with a #{value.class}"
     end
  end

end
