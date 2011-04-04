require 'ujs_sort_helper'

ActionView::Base.send(:include, UjsSortHelper)
ActionController::Base.send(:include, UjsSortHelper)
