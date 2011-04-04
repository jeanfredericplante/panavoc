module UjsSortHelper
  module Generators
    class InstallGenerator < Rails::Generators::Base

      desc <<DESC
Description:
    Copy ujs_sort_helper files to your public directory
DESC

      def self.source_root
        @source_root ||= File.expand_path(File.join(File.dirname(__FILE__), 'templates'))
      end

      def copy_public_files
        directory 'public'
      end
    end
  end
end
