# encoding: utf-8

module Constants
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
end
