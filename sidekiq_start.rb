require 'dotenv'
Dotenv.load('.ruby-env')
($LOAD_PATH << 'workers').uniq!
require 'send_coins_worker'
