# encoding: utf-8

require "rubygems"
require "mechanize"
require "yaml"
require_relative "constants"

module Scrapper
  include Constants

  def Scrapper.save(schools, parameters)
    filename = "#{parameters[:provincia].to_s}#{parameters[:nivel].to_s}#{parameters[:regimen]}.yml"
		# TODO: create export directory if doesn't exist
		if !Dir.exist?("#{SAVED_FILES}")
			Dir.mkdir("#{SAVED_FILES}")
		end
    File.open("#{SAVED_FILES}/#{filename}", "w") { |f| f.write(schools.to_yaml) }
  end

  def Scrapper.scrap(parameters)
    agent = Mechanize.new

    nivel = CodigoNivel[parameters[:nivel]] || "%"
    provincia = CodigoProvincia[parameters[:provincia]] || "%"
    regimen = CodigoRegimen[parameters[:regimen]] || "%"

    page = agent.post URL, :cnivel => nivel, :cprov => provincia, :cregimen => regimen
    
		schools = []
    page.search("div#contenidoInferior tr[valign='top']").each do |row|
      school = {}
      #school[:niveles] = [parameters[:nivel]] unless nivel == "%"
      school[:provincia] = parameters[:provincia] unless provincia == "%"
      school[:regimen] = parameters[:regimen] unless regimen == "%"
      school[:codigo] = row.children[0].text.strip
      school[:link] = "#{URL_BASE}#{row.children[0].at_css("a")["href"]}"
      school[:nombre] = row.children[2].text.strip
      #school[:regimen] = row.children[4].text.strip
      school[:direccion] = row.children[6].text.strip
      school[:cp],school[:ciudad] = row.children[8].text.strip.split(/\s* - \s*/)
      school[:telefono] = row.children[10].text.strip
      school = school.merge(scrap_school(agent, school[:link]))
      schools << school
    end
    save(schools, parameters)
    return schools
  end

  def Scrapper.scrap_levels(page)
    levels = []

    path_levels = {basic: "div#secc1 div.nivelCentro table:first td:first-child",
                   bachiller: "div#secc2 div.nivelCentro table:first td:first-child",
                   fp_familia: "div#secc3 div.nivelCentro > table:first tr:nth-child(2) td:first",
                   fp_ciclo: "div#secc3 div.nivelCentro > table:first tr:nth-child(2) td:nth-child(2)"}

     path_levels.each do |level, level_path|
      results = page.search(level_path)
      results.each do |cell|
        if DescNiveles.has_value?(cell.text) then
          levels << DescNiveles.key(cell.text)
        else
          raise "Nivel #{cell.text} no encontrado. #{level}"
        end
      end
    end

    return levels
  end

  def Scrapper.scrap_school(agent, url)
    school = {}
    page = agent.get url
    web_search = page.search("img[src='../images/INTErnet.gif']")[0]
    if !web_search.nil?
      school[:web] = web_search.parent["href"].strip
    end
    
    email_search = page.search("img[src='../images/correo2.gif']")[0]
    if !email_search.nil?
      school[:email] = email_search.parent["href"].sub("mailto:","").strip
    end

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
