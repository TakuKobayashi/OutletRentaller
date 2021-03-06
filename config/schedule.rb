# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#

# 出力先のログファイルの指定
set :output, {:error => 'log/error.log', :standard => 'log/cron.log'}
# ジョブの実行環境の指定
set :environment, :production

every 1.minutes do
  runner "RentalRegister.call_phone"
end