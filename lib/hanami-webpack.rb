require 'hanami/utils/blank'
require_relative 'hanami_webpack/view_helper'
require_relative 'hanami_webpack/dev_server'

if Hanami::Utils::Blank.blank?(ENV['WEBPACK_MANIFEST_FILE'])
  ENV['WEBPACK_MANIFEST_FILE'] = 'webpack_manifest.json'
end

if Hanami::Utils::Blank.blank?(ENV['WEBPACK_DEV_SERVER_HOST'])
  ENV['WEBPACK_DEV_SERVER_HOST'] = 'localhost'
end

if Hanami::Utils::Blank.blank?(ENV['WEBPACK_DEV_SERVER_PORT'])
  ENV['WEBPACK_DEV_SERVER_PORT'] = '3020'
end

if Hanami::Utils::Blank.blank?(ENV['WEBPACK_PUBLIC_PATH'])
  ENV['WEBPACK_PUBLIC_PATH'] = '/'
end

if Hanami::Utils::Blank.blank?(ENV['INBUILT_WEBPACK_DEV_SERVER'])
  ENV['INBUILT_WEBPACK_DEV_SERVER'] = 'true'
end

begin
  require 'hanami/server'
  Hanami::Server.prepend(HanamiWebpack::DevServer)
rescue LoadError
  # ok
end

begin
  require 'hanami/view'
  Hanami::View.prepend(HanamiWebpack::ViewHelper)
rescue LoadError
  # ok
end
