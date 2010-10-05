# My Cron Jobs in ruby, easier to read
# using http://github.com/javan/whenever

# unload the system apache if it's running
every 1.day, :at => '1:00 pm' do 
  command "sudo launchctl remove org.apache.httpd"
end

# update homebrew formulas
every 1.day, :at => '1:30 pm' do
  command "brew -v update"
end

# Git Pull all the ruby repos in my build directory
every 1.day, :at => '2.30 pm' do
  command "cd ~/build/ruby; for i in *; do cd $i; git pull; cd ..; done"
end

# Git Pull all my yammer code in case I forgot to and people commit stuff
every 1.day, :at => '2:35 pm' do
  command "yt; for i in *; do cd $i; gpl; cd ..; done"
end

# delete incomplete music rips
every 1.day, :at => '3:00 pm' do 
  command "find /Users/sahilcooner/Music -name incomplete -exec rm -fr {} \;"
end