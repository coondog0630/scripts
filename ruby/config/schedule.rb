# My Cron Jobs in ruby, easier to read

# whenever 

every :hour do
  command "port -v selfupdate && port -v upgrade outdated"
end

every :hour do
  command "brew -v update"
end
