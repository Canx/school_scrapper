require "vcr"
require_relative "../lib/scrapper.rb"

provincia = [:castellon, :valencia, :alicante]
niveles = [:guarderia, :infantil, :primaria, :especial, :eso, :bachiller, :fp]
regimen = [:publico, :privado]

VCR.configure do |c|
  c.cassette_library_dir = 'vcr'
  c.hook_into :fakeweb
  c.default_cassette_options = { :record => :new_episodes }
end


VCR.use_cassette "all" do
  provincia.each do |p|
    niveles.each do |n|
      regimen.each do |r|
        puts "scraping #{p.to_s} #{n.to_s} #{r.to_s}"
        Scrapper::scrap(nivel: n, provincia: p, regimen: r)
      end
    end
  end
end
