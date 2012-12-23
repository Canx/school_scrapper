# encoding: utf-8

module Constants
  URL_BASE = "http://www.cece.gva.es/ocd/areacd/val/"
  URL = "#{URL_BASE}niveles_ens.asp"
	SAVED_FILES = "export"

  DescNiveles = {
             :jardin_inf => "PREESCOLAR-JARDÍ D'INFÀNCIA",
             :infantil_1 => "EDUCACIÓ INFANTIL PRIMER CICLE",
             :infantil_2 => "EDUCACIÓ INFANTIL SEGON CICLE",
             :parvulos => "PREESCOLAR COL·LEGI DE PÀRVULS",
             :primaria => "EDUCACIÓ PRIMÀRIA",
             :especial => "EDUCACIÓ ESPECIAL",
             :adultos => "EDUCACIÓ D'ADULTS",
             :eso => "EDUCACIÓ SECUNDÀRIA OBLIGATÒRIA",
             :eso_1ciclo => "EDUCACIÓ SECUNDÀRIA OBLIGATÒRIA 1er CICLE",
             :eso_2ciclo => "EDUCACIÓ SECUNDÀRIA OBLIGATÒRIA 2n CICLE",
             :bachiller => "BATXILLERAT",
             :bachiller_ciencias => "CIÈNCIES I TECNOLOGIA",
             :bachiller_humanidades => "HUMANITATS I CIÈNCIES SOCIALS",
             :bachiller_artes_plasticas => "ARTS PLÀSTIQUES, DISSENY I IMATGE",
             :bachiller_artes_escenicas => "ARTS ESCÈNIQUES, MÚSICA I DANSA",
             :bachiller_internacional => "BATXILLERAT INTERNACIONAL",
             :fp => "CICLES FORMATIUS",
             :fp_modulos => "MÒDULS PROFESSIONALS",
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
             :fp_ciclo_viajes => "AGÈNCIES DE VIATGES I GESTIÓ D'ESDEVENIMENTS",
             :fp_ciclo_signos => "INTERPRETACIÓ DE LA LLENGUA DE SIGNES",
             :fp_ciclo_estetica => "ESTÈTICA PERSONAL I DECORATIVA",
             :fp_ciclo_farmacia => "FARMÀCIA I PARAFARMÀCIA",
             :fp_ciclo_marina => "OPERACIÓ, CONTROL I MANT. MÀQUINES MARINES I INSTAL. VAIXELL",
             :fp_ciclo_obras_interior => "OBRES D'INTERIOR, DECORACIÓ I REHABILITACIÓ",
             :fp_ciclo_direccion_cocina => "DIRECCIÓ DE CUINA",
             :fp_ciclo_pasteleria => "FORN, REBOSTERIA I CONFITERIA",
             :fp_ciclo_dentista => "PRÓTESI DENTALS",
             :fp_ciclo_mecanizado => "MECANITZAT",
             :fp_ciclo_agroecologia => "PRODUCCIÓ AGROECOLÒGICA",
             :fp_ciclo_eficiencia => "EFICIÈNCIA ENERGÈTICA I ENERGIA SOLAR TÈRMICA",
             :fp_ciclo_calor => "INSTAL·LACIONS DE PRODUCCIÓ DE CALOR",
             :fp_ciclo_DAM => "DESENVOLUPAMENT D'APLICACIONS MULTIPLATAFORMA",
             :fp_ciclo_audiovisual => "REALITZACIÓ DE PROJECTES D'AUDIOVISUALS I ESPECTACLES",
             :fp_ciclo_emergencias_sanitarias => "EMERGÈNCIES SANITÀRIES",
             :fp_ciclo_estetica_integral => "ESTÈTICA INTEGRAL I BENESTAR",
             :fp_ciclo_ASIR => "ADMINISTRACIÓ DE SISTEMES INFORMÀTICS EN XARXA",
             :fp_ciclo_imagen_diagnostico => "IMATGE PER AL DIAGNÓSTIC",
             :fp_ciclo_logistica => "TRANSPORT I LOGÍSTICA",
             :fp_ciclo_produccion_agropecuaria => "PRODUCCIÓ AGROPECUÀRIA",
             :fp_ciclo_muebles => "INSTAL·LACIÓ I MOBLAMENT",
             :fp_ciclo_comercio_internacional => "COMERÇ INTERNACIONAL",
             :fp_ciclo_construccion => "CONSTRUCCIÓ",
             :fp_ciclo_comercial_marketing => "GESTIÓ COMERCIAL I MÀRQUETING",
             :fp_ciclo_sistemas_electrotecnicos => "SISTEMES ELECTROTÈCNICS I AUTOMATITZATS",
             :fp_ciclo_soldadura => "SOLDADURA I CALDERERIA",
             :fp_ciclo_buceo => "BUSSEIG A MITJA PROFUNDITAT",
             :fp_ciclo_animacion_sociocultural => "ANIMACIÓ SOCIOCULTURAL",
             :fp_ciclo_lab_clinico => "LABORATORI DE DIAGNOSTIC CLÍNIC",
             :fp_ciclo_mant_termiques => "MANTENIMENT D'INSTAL·LACIONS TÈRMIQUES I DE FLUIDS",
             :fp_ciclo_electro_auto => "ELECTROMECÀNICA DE VEHICLES AUTOMÒBILS",
             :fp_ciclo_carroceria => "CARROSSERIA",
             :fp_ciclo_automocion => "AUTOMOCIÓ",
             :fp_ciclo_pesca => "PESCA I TRANSPORT MARÍTIM",
             :fp_ciclo_maquinas_marinas => "SUPERVISIÓ I CONTROL DE MÀQUINES MARINES I INSTAL·LACIÓ VAIXELL",
             :fp_ciclo_transporte_maritimo => "TRANSPORT MARÍTIM I PESCA D'ALTURA",
             :fp_ciclo_sistemas_teleco => "SISTEMES DE TELECOMUNICACIONS I INFORMÀTICS",
             :fp_ciclo_mant_electro => "MANTENIMENT ELECTRÒNIC",
             :fp_ciclo_produccion_mecanica => "PROGRAMACIÓ DE LA PRODUCCIÓ EN FABRICACIÓ MECÀNICA",
             :fp_ciclo_mecatronica_industrial => "MECATRÓNICA INDUSTRIAL",
             :fp_ciclo_caracterizacion => "CARACTERITZACIÓ",
             :fp_ciclo_asesoria_imagen => "ASSESSORIA D'IMATGE PERSONAL",
             :fp_ciclo_servicios_consumidor => "SERVICIS AL CONSUMIDOR",
             :fp_ciclo_planes_obra => "REALITZACIÓ I PLANS D'OBRA",
             :fp_ciclo_citologia => "ANATOMIA PATÓLOGICA-CITÓLOGIA",
             :fp_ciclo_higiene_bucodental => "HIGIENE BUCODENTAL",
             :fp_ciclo_DAW => "DESENVOLUPAMENT D'APLICACIONS WEB",
             :fp_ciclo_restauracion => "DIRECCIÓ DE SERVICIS DE RESTAURACIÓ",
             :fp_ciclo_guia_turistico => "GUIA, INFORMACIÓ I ASSISTÈNCIA TURÍSTIQUES",
             :fp_ciclo_gestion_turistica => "GESTIÓ D'ALLOTJAMENTS TURÍSTICS",
             :fp_ciclo_procesos_alimentos => "PROCESSOS I QUALITAT EN LA INDÚSTRIA ALIMENTÀRIA",
             :fp_ciclo_quimica_ambiental => "QUÍMICA AMBIENTAL",
             :fp_ciclo_control_calidad => "LABORATORI D'ANÀLISI I DE CONTROL DE QUALITAT",
             :fp_ciclo_electronica_consumo => "EQUIPS ELECTRÓNICS DE CONSUM",
             :fp_ciclo_servicios_restauracion => "SERVICIS DE RESTAURACIÓ",
             :fp_ciclo_salud_ambiental => "SALUT AMBIENTAL",
             :fp_ciclo_mueble => "FUSTERIA I MOBLE",
             :fp_ciclo_retoque_fotografico => "IL·LUMINACIÓ, CAPTACIÓ I TRACTAMENT D'IMATGE",
             :fp_ciclo_sonido_espectaculos => "SO PER A AUDIOVISUALS I ESPECTACLES",
             :fp_ciclo_mant_frio_calor => "MUNTATGE I MANTENIMENT INSTAL·LACIONS FRED,CLIMATITZACIÓ I PRODUCCIO DE CALOR",
             :fp_ciclo_prevencion_riesgos => "PREVENCIÓ DE RISCOS PROFESSIONALS",
             :fp_ciclo_preimpresion_digital => "PREIMPRESSIÓ DIGITAL",
             :fp_ciclo_proyectos_termicos => "DESENVOLUPAMENT DE PROJECTES D'INSTAL·LACIONS TÈRMIQUES I DE FLUIDS",
             :fp_ciclo_produccion_audiovisuales => "PRODUCCIÓN DE AUDIOVISUALES Y ESPECTÁCULOS",
             :fp_ciclo_dietetica => "DIETÈTICA",
             :fp_ciclo_ceramica => "DESENVOLUPAMENT I FABRICACIÓ DE PRODUCTES CERÀMICS",
             :fp_ciclo_documentacion_sanitaria => "DOCUMENTACIÓ SANITARIA",
             :fp_ciclo_confeccion_moda => "CONFECCIÓ I MODA",
             :fp_ciclo_disenyo_mueble => "DISSENY I MOBLAMENT",
             :fp_ciclo_gestion_forestal => "GESTIÓ FORESTAL I DEL MEDI NATURAL",
             :fp_ciclo_mant_aeromecanico => "MANTENIMENT AEROMECÀNIC",
             :fp_ciclo_mant_avionica => "MANTENIMENT D'AVIÓNICA",
             :fp_ciclo_disenyo_calzado => "DISSENY I PRODUCCIÓ DE CALÇAT I COMPLEMENTS",
             :fp_ciclo_disenyo_produccion_editorial => "DISSENY I PRODUCCIÓ EDITORIAL",
             :fp_ciclo_transf_plasticos_caucho => "OPERACIONS DE TRANSFORMACIÓ DE PLÀSTICS I CAUTXU",
             :fp_ciclo_plasticos_caucho => "PLÀSTICS I CAUTXU",
             :fp_ciclo_optica => "ÓPTICA I PROTETICA OCULAR",
             :fp_ciclo_joyeria => "JOIERIA",
             :fp_ciclo_disenyo_fab_mecanica => "DISSENY EN FABRICACIÓ MECÀNICA",
             :fp_ciclo_ortoprotesica => "ORTOPROTÈSICA",
             :fp_ciclo_fab_productos_ceramicos => "FABRICACIÓ DE PRODUCTES CERÀMICS",
             :fp_ciclo_radioterapia => "RADIOTERÀPIA",
             :fp_ciclo_aceites_vinos => "OLIS D'OLIVA I VINS",
             :fp_ciclo_vitivinicultura => "VITIVINICULTURA",
             :fp_ciclo_tratamientos_superf_termicos => "TRACTAMENTS SUPERFICIALS I TÈRMICS",
             :fp_ciclo_construcciones_metalicas => "CONSTRUCCIONS METÀL·LIQUES",
             :fp_ciclo_audiologia_protesica => "AUDIOLOGÍA PROTÈSICA",
             :fp_ciclo_produccion_indust_grafica => "PRODUCCIÓ EN INDUSTRIES D'ARTS GRÀFIQUES",
             :fp_ciclo_instal_electrotecnicas => "INSTAL·LACIONS ELECTROTÈCNIQUES",
             :fp_ciclo_proyectos_construccion => "DESENVOLUPAMENT I APLICACIÓ DE PROJECTES DE CONSTRUCCIÓ",
             :escuelas_musica => "ESCOLES DE MÚSICA",
             :ens_prof_musica => "ENSENYANCES PROFESSIONALS DE MÚSICA   ",
             :ens_elem_musica => "ENSENYANCES ELEMENTALS DE MÚSICA   ",
             :ens_sup_musica => "ENSENYANCES SUPERIORS DE MÚSICA   ",
             :fp_ciclos_artes_plasticas => "CICLES FORMATIUS D'ARTS PLÀSTIQUES I DISSENY   ",
             :est_sup_artes_plasticas => "ESTUDIS SUPERIORS D'ARTS PLÀSTIQUES I DISSENY   ",
             :idiomas => "IDIOMES   "
                }

  CodigoNivel = {
                 :infantil_1 => "10",
                 :infantil_2 => "11",
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
                 
  DescRegimen = {
                 :publico => "PÚBLIC",
                 :privado => "PRIVAT",
                 :concertado => "PRIVAT - CONCERTAT"
                }
end
