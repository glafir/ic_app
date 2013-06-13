# #encoding: utf-8
# Load the rails application
require File.expand_path('../application', __FILE__)
Encoding.default_internal = 'utf-8'
Encoding.default_external = 'utf-8'
# Initialize the rails application
IcApp::Application.initialize!

WillPaginate::ViewHelpers.pagination_options[:previous_label] = '<< Предыдущая'
WillPaginate::ViewHelpers.pagination_options[:next_label] = 'Следующая >>'
WillPaginate::ViewHelpers.pagination_options[:data] = '111'
