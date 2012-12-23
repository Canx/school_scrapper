# join and compress yaml export files and upload to dropbox
require "yaml"
require "zlib"

Export_Dir = "export/"

schools = []
Dir.entries(Export_Dir).each do |entry|
  if File.extname(entry) == ".yml"
    puts "#{entry}"
    schools << YAML.load(open(Export_Dir + entry))
  end
end

joined_schools = []
schools.each do |file_schools|
  file_schools.each do |school|
    joined_schools << school
  end
end

Zlib::GzipWriter.open("#{Export_Dir}/schools.yaml.gz") do |f|
  f.write(joined_schools.to_yaml)
end

# TODO: upload to dropbox
