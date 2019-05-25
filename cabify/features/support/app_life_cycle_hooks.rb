require 'calabash-android/management/adb'
require 'calabash-android/operations'

Before do |scenario|
  reinstall_test_server
  reinstall_apps
  start_test_server_in_background
end

After do |scenario|
  if scenario.failed?
    screenshot_embed
  end
shutdown_test_server
uninstall_apps
end
