# encoding: utf-8

require 'spec_helper'

describe Scrapper do
  context "mobydick" do
    before(:all) do
      VCR.use_cassette "mobydick" do
        @school = Scrapper::scrap(:codigo => 12007243)
      end
    end

    it "should get the correct code" do
      @school[:codigo].should eq("12007243")
    end

    it "should get the correct name" do
      @school[:nombre].should eq("MOBY DICK")
    end

    it "should get the correct web page" do
      @school[:web].should eq(nil)
    end

    it "should get the correct address" do
      @school[:direccion].should eq("Carrer VALENCIA, PARTIDA SOLAES, 810")
    end

    it "should get the correct city" do
      @school[:ciudad].should eq("BENICARLÓ")
    end

    it "should get the correct postal code" do
      @school[:cp].should eq("12580")
    end

    it "should return correct phone school" do
			@school[:telefono].should eq("964472960")
		end
    
    it "should return correct gps coordinates" do
      @school[:longitud].should eq("0.42233")
      @school[:latitud].should eq("40.409346")
    end

    it "should return correct levels" do
      @school[:niveles].should include(:infantil_1, :infantil_2)
    end

    it "should return correct regime" do
      @school[:regimen].should eq(:privado)
    end
  end

  context "escuelahogar" do
    before(:all) do
      VCR.use_cassette "escuelahogar" do
        @school = Scrapper::scrap(:codigo => "12001915")
      end
    end

    it "should get code" do
      @school[:codigo].should eq("12001915")
    end

    it "should get no levels" do
      @school[:niveles].should eq([])
    end

    it "should get correct web page" do
      @school[:web].should eq("http://intercentres.edu.gva.es/intercentres/12001903/escllar.htm")
    end
  end

  context "doctorbalmis" do
    before(:all) do
      VCR.use_cassette "doctorbalmis" do
        @school = Scrapper::scrap(:codigo => "03013819")
      end
    end

    it "should get correct levels" do
      @school[:niveles].should include(:bachiller, :eso, :fp)
      @school[:niveles].should include(:bachiller_ciencias, :bachiller_humanidades)
    end
  end

  context "concertado" do
    before(:all) do
      VCR.use_cassette "concertado" do
        @school = Scrapper::scrap(:codigo => "12005349")
      end
    end

    it "should get correct regime" do
      @school[:regimen].should eq(:concertado_privado)
    end
  end

  context "no_existente" do
    before(:all) do
      VCR.use_cassette "no_existente" do
        @school = Scrapper::scrap(:codigo => "03018258")
      end
    end

    it "should get no school" do
      @school.should eq(nil)
    end
  end
#	context "given a query to fp level" do
#    before(:all) do
#      VCR.use_cassette "fp" do
#        @schools = Scrapper::scrap(:nivel => :fp, :provincia => :valencia, :regimen => :publico)
#      end
#    end
#
#    it "should return 'GESTIÓ ADMINISTRATIVA' sublevel" do
#      @schools[11][:niveles].should include(:fp_ciclo_gestion_administrativa)
#    end
#  end
#
#  context "given all fp levels" do
#    before(:all) do
#      VCR.use_cassette "all_fp" do
#        @schools = Scrapper::scrap(:nivel => :fp)
#      end
#    end
#
#    it "should verify IES ABASTOS fp cicles" do
#      @schools.each_with_index do |school,index|
#        if school[:nombre] == "INSTITUT EDUCACIÓ SECUNDÀRIA ABASTOS"
#          school[:niveles].should include(:fp_ciclo_gestion_administrativa, 
#                                          :fp_ciclo_finanzas,
#                                          :fp_ciclo_comercio,
#                                          :fp_ciclo_logistica,
#                                          :fp_ciclo_comercio_internacional,
#                                          :fp_ciclo_DAM,
#                                          :fp_ciclo_SMR,
#                                          :fp_ciclo_ASIR,
#                                          :fp_ciclo_DAW
#                                         )
#        end
#      end
#    end
#
#    it "should get the public status" do
#      @schools[0][:publico].should be(true)
#    end
#  end
end
