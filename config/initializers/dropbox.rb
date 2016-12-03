require 'dropbox_sdk'

DROPBOX_CLIENT = DropboxClient.new(Rails.application
                                        .config
                                        .ourblog['dropbox']['access_token'])
puts "Linked to account : #{DROPBOX_CLIENT.account_info.inspect}"
