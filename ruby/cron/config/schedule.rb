# My Cron Jobs in ruby, easier to read
# using http://github.com/javan/whenever

# define my own job types

every 1.day, :at => '10:30 am' do
  command "sudo brew -v update"
  # rake    "some:rake:task"
  # runner  "MyModel.task_to_run"
end

every 1.day, :at => '2.30 pm' do
  command "cd ~/build/ruby; for i in *; do cd $i; git pull; cd ..; done"
end

every 1.day, :at => '2.35 pm' do
  command "yt; for i in *; do cd $i; gpl; cd ..; done"
end
