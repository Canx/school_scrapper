# encoding: utf-8

module Constants
  URL_BASE = "http://www.cefe.gva.es/ocd/areacd/val/"
  URL = "#{URL_BASE}niveles_ens.asp"
	SAVED_FILES = "export"

  DescNiveles = {
             :guarderia => "EDUCACIÓ INFANTIL PRIMER CICLE",
             :infantil => "EDUCACIÓ INFANTIL SEGON CICLE",
             :primaria => "EDUCACIÓ PRIMÀRIA",
             :especial => "EDUCACIÓ ESPECIAL",
             :adultos => "EDUCACIÓ D'ADULTS",
             :eso => "EDUCACIÓ SECUNDÀRIA OBLIGATÒRIA",
             :eso_1ciclo => "EDUCACIÓ SECUNDÀRIA OBLIGATÒRIA 1er CICLE",
             :bachiller => "BATXILLERAT",
             :bachiller_ciencias => "CIÈNCIES I TECNOLOGIA",
             :bachiller_humanidades => "HUMANITATS I CIÈNCIES SOCIALS",
             :bachiller_artes_plasticas => "ARTS PLÀSTIQUES, DISSENY I IMATGE",
             :bachiller_artes_escenicas => "ARTS ESCÈNIQUES, MÚSICA I DANSA",
             :bachiller_internacional => "BATXILLERAT INTERNACIONAL",
             :fp => "CICLES FORMATIUS",
             :fp_familia_administracio => "ADMINISTRACIÓ I GESTIÓ",
             :fp_familia_imatge_i_so => "IMATGE I SO",
             :fp_familia_informatica_i_comunicaciones => "INFORMÀTICA I COMUNICACIONS",
             :fp_familia_servicios_sociales => "SERVICIS SOCIOCULTURALS I A LA COMUNITAT",
             :fp_familia_comercio => "COMERÇ I MÀRQUETING",
             :fp_familia_deporte => "ACTIVITATS FÍSIQUES I ESPORTIVES",
             :fp_familia_electronica => "ELECTRICITAT I ELECTRÒNICA",
             :fp_familia_artes => "ARTS I ARTESANIES",
             :fp_familia_edificacion => "EDIFICACIÓ I OBRA CIVIL",
             :fp_familia_quimica => "QUÍMICA",
             :fp_familia_instalacion => "INSTAL·LACIÓ I MANTENIMENT",
             :fp_familia_actividades_agrarias => "ACTIVITATS AGRÀRIES",
             :fp_familia_imagen => "IMATGE PERSONAL",
             :fp_familia_confeccion => "TÈXTIL, CONFECCIÓ I PELL",
             :fp_familia_sanidad => "SANITAT",
             :fp_familia_energia => "ENERGIA I AIGUA",
             :fp_familia_hosteleria => "HOTELERIA I TURISME",
             :fp_familia_admin => "ADMINISTRACIÓ",
             :fp_familia_imagen_sonido => "COMUNICACIÓ, IMATGE I SO",
             :fp_familia_agraria => "AGRÀRIA",
             :fp_familia_informatica => "INFORMÀTICA",
             :fp_familia_graficas => "ARTS GRÀFIQUES",
             :fp_ciclo_gestion_administrativa => "GESTIÓ ADMINISTRATIVA",
             :fp_ciclo_video_disc_jockey => "VÍDEO DISC-JOCKEY I SO",
             :fp_ciclo_SMR => "SISTEMES MICROINFORMÀTICS I XARXES",
             :fp_ciclo_atencion_dependencia => "ATENCIÓ A PERSONES EN SITUACIÓ DE DEPENDÈNCIA",
             :fp_ciclo_comercio => "COMERÇ",
             :fp_ciclo_fisico_natural => "CONDUCCIÓ ACTIVITATS FÍSICO-ESPORTIVES EN EL MEDI NATURAL",
             :fp_ciclo_instalaciones_electricas => "INSTAL·LACIONS ELÈCTRIQUES I AUTOMÀTIQUES",
             :fp_ciclo_artista_faller => "ARTISTA FALLER I CONSTRUCCIÓ D'ESCENOGRAFIES",
             :fp_ciclo_obra_civil => "POJECTES D'OBRA CIVIL",
             :fp_ciclo_laboratorio => "LABORATORI",
             :fp_ciclo_edificacion => "PROJECTES D'EDIFICACIÓ",
             :fp_ciclo_mant_electromec => "MANTENIMENT ELECTROMECÀNIC",
             :fp_ciclo_inst_teleco => "INSTAL·LACIONS DE TELECOMUNICACIONS",
             :fp_ciclo_forestales => "TREBALLS FORESTALS I DE CONSERVACIÓ DEL MEDI NATURAL",
             :fp_ciclo_peluqueria => "PERRUQUERIA I COSMÈTICA CAPIL·LAR",
             :fp_ciclo_moda => "PATRONAJE I MODA",
             :fp_ciclo_enfermeria => "CURES AUXILIARES D'INFERMERIA",
             :fp_ciclo_renovables => "ENERGIES RENOVABLES",
             :fp_ciclo_agropec => "GESTIÓ I ORGANITZACIÓ D'EMPRESES AGROPECUARIES",
             :fp_ciclo_social => "INTEGRACIÓ SOCIAL",
             :fp_ciclo_cocina => "CUINA I GASTRONOMIA",
             :fp_ciclo_secretaria => "SECRETARIAT",
             :fp_ciclo_lab_imagen => "LABORATORI D'IMATGE",
             :fp_ciclo_restauracion => "SERVICIS DE RESTAURACIÓ",
             :fp_ciclo_climatizacion => "INSTAL·LACIONS FRIGORIFÍQUES I DE CLIMATITZACIÓ",
             :fp_ciclo_jardineria => "JARDINERIA I FLORISTERIA",
             :fp_ciclo_infantil => "EDUCACIÓ INFANTIL",
             :fp_ciclo_robotica => "AUTOMATITZACIÓ I ROBÒTICA INDUSTRIAL",
             :fp_ciclo_animacion_turistica => "ANIMACIÓ TURÍSTICA",
             :fp_ciclo_DAI => "DESENROTLLAMENT D'APLICACIONS INFORMÀTIQUES",
             :fp_ciclo_animacion_fisica => "ANIMACIÓ D'ACTIVITATS FÍSIQUES I ESPORTIVES",
             :fp_ciclo_finanzas => "ADMINISTRACIÓ I FINANCES",
             :fp_ciclo_impresion => "IMPRESSIÓ EN ARTS GRÀFIQUES",
             :fp_ciclo_viajes => "AGÈNCIES DE VIATGES I GESTIÓ D'ESDEVENIMENTS"
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
