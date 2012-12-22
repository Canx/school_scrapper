require "bundler/gem_tasks"
require "lib/scrapper"

task "scrap" => ["guarderia.yml","infantil.yml"]

file "guarderia.yml" do |t|
  Scrapper::scrap(:nivel => :guarderia)
end

file "infantil.yml" do |t|
  Scrapper::scrap(:nivel => :infantil)
end
