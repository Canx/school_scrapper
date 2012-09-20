# encoding: utf-8

require "rubygems"
require "mechanize"
require "yaml"

module Scrapper
  URL_BASE = "http://www.cefe.gva.es/ocd/areacd/val/"
  URL = "#{URL_BASE}niveles_ens.asp"

  Niveles =  {
             :guarderia  => ["Guarderia", nil],
             :infantil   => ["Infantil", nil],
             :primaria   => ["Primaria", nil],
             :eso        => ["ESO", nil],
             :eso_2ciclo => ["ESO 2do ciclo", :eso],
             :eso_1ciclo => ["ESO 1er ciclo", :eso],
             :bachiller  => ["Bachiller", nil],
             :bachiller_ciencias => ["Bachiller: Ciencias y tecnologia", :bachiller],
             :bachiller_humanidades => ["Bachiller: Humanidades y ciencias sociales", :bachiller],
             :bachiller_artes_plasticas => ["Bachiller: Artes plásticas, diseño y imagen", :bachiller],
             :bachiller_artes_escenicas => ["Bachiller: Artes escénicas, música y danza", :bachiller],
             :fp         => ["Formacion Profesional", nil]
            }

  DescNiveles = {
             :guarderia => "EDUCACIÓ INFANTIL PRIMER CICLE",
             :infantil => "EDUCACIÓ INFANTIL SEGON CICLE",
             :primaria => "EDUCACIÓ PRIMÀRIA",
             :especial => "EDUCACIÓ ESPECIAL",
             :eso => "EDUCACIÓ SECUNDÀRIA OBLIGATÒRIA",
             :eso_1ciclo => "EDUCACIÓ SECUNDÀRIA OBLIGATÒRIA 1er CICLE",
             :bachiller => "BATXILLERAT",
             :bachiller_ciencias => "CIÈNCIES I TECNOLOGIA",
             :bachiller_humanidades => "HUMANITATS I CIÈNCIES SOCIALS",
             :bachiller_artes_plasticas => "ARTS PLÀSTIQUES, DISSENY I IMATGE",
             :bachiller_artes_escenicas => "ARTS ESCÈNIQUES, MÚSICA I DANSA",
             :fp => "CICLES FORMATIUS"
                }

  CodigoNivel = {
                 :guarderia => "10",
                 :infantil => "11",
                 :primaria => "12",
                 :eso => "13",
                 :eso_1ciclo => "53",
                 :eso_2ciclo => "54",
                 :bachiller => "05",
                 :fp => "09"
                }

  CodigoProvincia = { 
                 :castellon => "12%",
                 :valencia => "46%",
                 :alicante => "3%"
                    }

  CodigoRegimen = {
                 :publico => "1",
                 :privado => "2"
                  }


  def Scrapper.save(schools, parameters)
    filename = "#{parameters[:nivel].to_s}.yml"
    File.open(filename, "w") { |f| f.write(schools.to_yaml) }
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

    #niveles básicos
    page.search("div#secc1 td:first-child").each do |cell|
      if DescNiveles.has_value?(cell.text) then
        levels << DescNiveles.key(cell.text)
      end
    end

    # tipos bachiller
    page.search("div#secc2 td:first-child").each do |cell|
      pp cell.text
      if DescNiveles.has_value?(cell.text) then
        levels << DescNiveles.key(cell.text)
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

    school[:niveles] = scrap_levels(page)

    # TODO: latitud y longitud 
    # latitude_search = page.search
    return school
  end

end

#shools = Scrapper.scrap(:level => :eso, :prov => :castellon}
