#encoding: utf-8

require "rubygems"
require "mechanize"
require "yaml"
require "debugger"
require_relative "constants"

module Scrapper
  include Constants

  def Scrapper.filename(parameters)
    "#{parameters[:codigo].to_s}#{parameters[:provincia].to_s}#{parameters[:nivel].to_s}#{parameters[:regimen]}.yml"
  end

  def Scrapper.save(schools, parameters)
		# TODO: create export directory if doesn't exist
		if !Dir.exist?("#{SAVED_FILES}")
			Dir.mkdir("#{SAVED_FILES}")
		end
    File.open("#{SAVED_FILES}/#{filename(parameters)}", "w") { |f| f.write(schools.to_yaml) }
  end

  def Scrapper.scrap(parameters)
    #return if File.exist?("#{SAVED_FILES}/#{filename(parameters)}")
    
    agent = Mechanize.new

    if parameters[:codigo]
      schools = scrap_school(agent, "http://www.cece.gva.es/ocd/areacd/val/centro.asp?codi=#{parameters[:codigo]}")
    else
      nivel = CodigoNivel[parameters[:nivel]] || "%"
      provincia = CodigoProvincia[parameters[:provincia]] || "%"
      regimen = CodigoRegimen[parameters[:regimen]] || "%"
      schools = scrap_school_list(agent, nivel, provincia, regimen)
    end

    save(schools, parameters)
    puts
    return schools
  end

  def Scrapper.scrap_school_list(agent, nivel, provincia, regimen) 
    page = agent.post URL, :cnivel => nivel, :cprov => provincia, :cregimen => regimen
    
		schools = []
    page.search("div#contenidoInferior tr[valign='top']").each do |row|
      @school = {}
      #school[:niveles] = [parameters[:nivel]] unless nivel == "%"
      @school[:provincia] = CodigoProvincia.key(provincia) unless provincia == "%"
      @school[:codigo] = row.children[0].text.strip
      puts @school[:codigo]
      @school[:link] = "#{URL_BASE}#{row.children[0].at_css("a")["href"]}"
      @school[:nombre] = row.children[2].text.strip
      #@school[:publico] = row.children[4].text.strip == "PUB."
      @school[:direccion] = row.children[6].text.strip
      @school[:cp],@school[:ciudad] = row.children[8].text.strip.split(/\s* - \s*/)
      @school[:telefono] = row.children[10].text.strip
      detailed_data = scrap_school(agent, @school[:link])

      if !detailed_data.nil?
        @school = @school.merge(detailed_data) 
        print "."
        schools << @school
      end
    end

    return schools
  end

  def Scrapper.scrap_levels(page)
    levels = []

    path_levels = {basic: "div#secc1 div.nivelCentro table tr td:first:not(:last)",
                   bachiller: "div#secc2 div.nivelCentro table:first td:first-child",
                   fp_ciclo: "div#secc3 div.nivelCentro > table:first tr:nth-child(n+2) td:nth-child(2)"}
                   #fp_familia: "div#secc3 div.nivelCentro > table:first tr:nth-child(n+2) td:first",
     path_levels.each do |level, level_path|
      results = page.search(level_path)
      results.each do |cell|
        content = cell.text.strip
        if DescNiveles.has_value?(content) then
          levels << DescNiveles.key(content)
        else
          raise "Nivel '#{content}' no encontrado. #{level}"
        end
      end
    end

    return levels
  end

  def Scrapper.scrap_school(agent, url)
    school = {}
    page = agent.get url

    # TODO: check if school exists
    error_search = page.search("img[src='../images/atencion2.gif']")[0]
    return nil if !error_search.nil?

    school[:codigo] = page.search("div.nivelCentro:first table:first tr:nth-child(2) td:first").text.split(":")[1].lstrip

    regimen = page.search("div.nivelCentro:first table:first tr:nth-child(2) td:nth-child(2)").text.split(":")[1].gsub(/ /,"").gsub(/\u000A/,"").gsub(/\u000D/,"").strip
    if DescRegimen.has_value?(regimen) then
      school[:regimen] = DescRegimen.key(regimen)
    else
      raise "Regimen \"#{regimen}\" no encontrado."
    end

    name = page.search("div.nivelCentro:first table:first tr:first td:first span.Estilo1").children[2]
    school[:nombre] = name.text.lstrip if !name.nil?

    school[:direccion] = page.search("div.nivelCentro:first table:nth-child(4) tr:first td:nth-child(3) span.Estilo1").text

    school[:telefono] = page.search("div.nivelCentro:first table:nth-child(4) tr:nth-child(2) td:nth-child(2) span.Estilo1").text.delete(" ")

    school[:ciudad] = page.search("div.nivelCentro table:nth-child(4) tr:nth-child(5) td:nth-child(2) span.Estilo1").text.gsub(/.*-/,"").lstrip

    school[:cp] = page.search("div.nivelCentro table:nth-child(4) tr:nth-child(5) td:nth-child(2) span.Estilo1").text.gsub(/-.*/,"").strip

    web_search = page.search("img[src='../images/INTErnet.gif']")[0]
    if !web_search.nil?
      school[:web] = web_search.parent["href"].strip
    end
    
    email_search = page.search("img[src='../images/correo2.gif']")[0]
    if !email_search.nil?
      school[:email] = email_search.parent["href"].sub("mailto:","").strip
    end

    school[:calidad] = 0
    quality1_search = page.search("img[src='../images/medalla1.png']")[0]
    quality2_search = page.search("img[src='../images/medalla2.png']")[0]
    quality3_search = page.search("img[src='../images/medalla3.png']")[0]
    school[:calidad] = 1 if !quality1_search.nil?
    school[:calidad] = 2 if !quality2_search.nil?
    school[:calidad] = 3 if !quality3_search.nil?

    latitud_search = page.search("div.nivelCentro table:nth-child(4) tr:nth-child(6) td:nth-child(3) div span").text
		if !latitud_search.nil?
			school[:latitud] = latitud_search
		end

		longitud_search = page.search("div.nivelCentro table:nth-child(4) tr:nth-child(6) td:nth-child(4) div span").text
		if !longitud_search.nil?
			school[:longitud] = longitud_search
		end

    school[:niveles] = scrap_levels(page)

    return school
  end

end
