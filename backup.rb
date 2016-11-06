# require 'byebug'
backups_str = '/home/webadmin/backups/'
www_str = '/home/webadmin/www/'
www = Dir.new(www_str)

www.each do |i|
# byebug
  next if i == '..' || i == '.' or !File.directory?(www_str + i)

  if File.exist?(www_str + i + '/wp-config.php') # то это wp, сохраняем БД
    puts "chdir to " + www_str + i
    Dir.chdir www_str + i
    puts `wp db export` # чтоб показать вывод
    puts "chdir back"
    Dir.chdir ".."
    puts 'сейчас я в папке ' + Dir.pwd
  end

    puts "архивирую папку #{i}"
    `zip -r #{backups_str}#{i}.zip #{www_str}#{i}`

end
