# encoding: utf-8

require 'spec_helper'

describe Scrapper do
  context "given a query to a specific school" do
    before(:all) do
      VCR.use_cassette "mobydick" do
        @school = Scrapper::scrap(:codigo => 12007243)
      end
    end

    it "should get the correct name" do
      @school[:name].should eq("MOBY DICK")
    end

    it "should get the correct web page" do
      @school[:web].should eq(nil)
    end

    it "should get the correct address" do
      @school[:direccion].should eq("Carrer VALENCIA, PARTIDA SOLAES, 810")
    end

    it "should return correct phone school" do
			@school[:telefono].should eq("964472960")
		end


  end

  context "given a query to a escuela hogar" do
    before(:all) do
      VCR.use_cassette "escuelahogar" do
        @school = Scrapper::scrap(:codigo => "12001915")
      end
    end

    it "should get no levels" do
      @school[:niveles].should eq([])
    end
  end

  context "given a query to guarderia level" do 
    before(:all) do
      VCR.use_cassette "guarderia" do
        @schools = Scrapper::scrap(:nivel => :infantil_1, :provincia => :castellon, :regimen => :privado)
      end
    end 

		# TODO: delete export directory and all files inside after tests

    it "should return all schools from that level" do
      @schools.size.should eq(37)
    end

		it "should return correct web page school" do
      @schools[4][:web].should eq("http://www.fomento.edu/torrenova/")
	  end

		it "should return correct city school" do
		  @schools[0][:ciudad].should eq("BENICARLÓ")
		end

		it "should return correct postal code school" do
			@schools[0][:cp].should eq("12580")
		end

		it "should return correct code school" do
			@schools[0][:codigo].should eq("12007243")
		end

    it "should return schools with the correct levels (1)" do
      @schools[5][:niveles].should include(:especial,:infantil_1,:infantil_2,:primaria,:eso)
    end

    it "should return schools with the correct levels (2)" do
      @schools[34][:niveles].should include(:fp, :infantil_1, :infantil_2, :primaria, :eso)
    end

		it "should return gps coordinates" do
			@schools[0][:latitud].should eq("40.409346")
			@schools[0][:longitud].should eq("0.42233")
		end

    it "should create a file named guarderia_castellon_privado.yml" do
			File.exists?("#{Scrapper::SAVED_FILES}/castelloninfantil_1privado.yml").should eq(true)
    end
  end

  context "given a query to bachiller level" do
    before(:all) do
      VCR.use_cassette "bachiller" do
        @schools = Scrapper::scrap(:nivel => :bachiller, :provincia => :castellon, :regimen => :publico)
      end
    end
    
    it "should return bachiller sublevels" do
			bachiller_sublevels = Set.new [:bachiller_ciencias, :bachiller_humanidades]
      bachiller_sublevels.subset?(@schools[0][:niveles].to_set).should eq(true)
    end
  end

	context "given a query to fp level" do
    before(:all) do
      VCR.use_cassette "fp" do
        @schools = Scrapper::scrap(:nivel => :fp, :provincia => :valencia, :regimen => :publico)
      end
    end

    it "should return 'GESTIÓ ADMINISTRATIVA' sublevel" do
      @schools[11][:niveles].should include(:fp_ciclo_gestion_administrativa)
    end
  end

  context "given all fp levels" do
    before(:all) do
      VCR.use_cassette "all_fp" do
        @schools = Scrapper::scrap(:nivel => :fp)
      end
    end

    it "should verify IES ABASTOS fp cicles" do
      @schools.each_with_index do |school,index|
        if school[:nombre] == "INSTITUT EDUCACIÓ SECUNDÀRIA ABASTOS"
          school[:niveles].should include(:fp_ciclo_gestion_administrativa, 
                                          :fp_ciclo_finanzas,
                                          :fp_ciclo_comercio,
                                          :fp_ciclo_logistica,
                                          :fp_ciclo_comercio_internacional,
                                          :fp_ciclo_DAM,
                                          :fp_ciclo_SMR,
                                          :fp_ciclo_ASIR,
                                          :fp_ciclo_DAW
                                         )
        end
      end
    end

    it "should get the public status" do
      @schools[0][:publico].should be(true)
    end
  end
end
