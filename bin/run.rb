require "vcr"
require_relative "../lib/scrapper.rb"

provincia = [:castellon, :valencia, :alicante]
niveles = [:infantil_1, :infantil_2, :primaria, :eso, :bachiller, :fp, :especial] 
regimen = [:publico, :privado]

VCR.configure do |c|
  c.cassette_library_dir = 'vcr'
  c.hook_into :fakeweb
  c.default_cassette_options = { :record => :new_episodes }
end


provincia.each do |p|
  niveles.each do |n|
    regimen.each do |r|
      VCR.use_cassette "#{p.to_s}#{n.to_s}#{r.to_s}" do
        puts "scraping #{p.to_s} #{n.to_s} #{r.to_s}"
        Scrapper::scrap(nivel: n, provincia: p, regimen: r)
      end
    end
  end
end
