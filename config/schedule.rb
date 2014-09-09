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
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever

# 使い方
# -bundle exec whenever　
#   crontabに書き出すコマンドが出力されるので、確認
#
# -crontab -r
#   crontabの内容を削除する
#
# -bundle exec whenever --update-crontab
#   crontabに実際に書き出す
#
# -crontab -l
# 　cronの設定が正しいことを確認
#
# 注意
#  前回分は削除されないので変更する場合は、crontab -r　で削除する
#  動作確認用(cron_setting)はお好きなときに、 確認してくださいませ
#
#

current_path="/home/taishi/app/current"

cd_path="cd #{current_path}"
# rails_runner="bundle exec rails runner -e production"
rails_runner="/home/taishi/.rbenv/shims/bundle exec rails runner -e production"

#バッチコマンド
# 36
follow40="#{rails_runner} Batches::Follow::Follow40.execute"
# 24
follow60="#{rails_runner} Batches::Follow::Follow60.execute"
# 18
follow80="#{rails_runner} Batches::Follow::Follow80.execute"
# 14
follow100="#{rails_runner} Batches::Follow::Follow100.execute"
# 10
follow150="#{rails_runner} Batches::Follow::Follow150.execute"

# 36
unfollow40="#{rails_runner} Batches::Unfollow::Unfollow40.execute"
# 24
unfollow60="#{rails_runner} Batches::Unfollow::Unfollow60.execute"
# 18
unfollow80="#{rails_runner} Batches::Unfollow::Unfollow80.execute"
# 14
unfollow100="#{rails_runner} Batches::Unfollow::Unfollow100.execute"
# 10
unfollow150="#{rails_runner} Batches::Unfollow::Unfollow150.execute"

#tweet
tweet3="#{rails_runner} Batches::Tweet::Tweet3.execute"

every 36.minutes do
  command "#{cd_path} && #{follow40}"
  command "#{cd_path} && #{unfollow40}"
end
every 24.minutes do
  command "#{cd_path} && #{follow60}"
  command "#{cd_path} && #{unfollow60}"
end
every 18.minutes do
  command "#{cd_path} && #{follow80}"
  command "#{cd_path} && #{unfollow80}"
end
every 14.minutes do
  command "#{cd_path} && #{follow100}"
  command "#{cd_path} && #{unfollow100}"
end
every 10.minutes do
  command "#{cd_path} && #{follow150}"
  command "#{cd_path} && #{unfollow150}"
end

every 8.hours do
  command "#{cd_path} && #{tweet3}"
end
