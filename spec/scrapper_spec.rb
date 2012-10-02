# encoding: utf-8

require 'spec_helper'

describe Scrapper do
  context "given a query to guarderia level" do 
    before(:all) do
      VCR.use_cassette "guarderia" do
        @schools = Scrapper::scrap(:nivel => :guarderia, :provincia => :castellon, :regimen => :privado)
      end
    end 

		# TODO: delete export directory and all files inside after tests

    it "should return all schools from that level" do
      @schools.size.should eq(36)
    end

		it "should return correct name school" do
			@schools[0][:nombre].should eq("CENTRE EDUCACIÓ INFANTIL MOBY DICK")
		end

		it "should return correct web page school" do
      @schools[4][:web].should eq("http://www.fomento.edu/torrenova/")
	  end

		it "should return correct address school" do
			@schools[0][:direccion].should eq("C. VALENCIA, PARTIDA SOLAES, 810")
		end

		it "should return correct phone school" do
			@schools[0][:telefono].should eq("649460442")
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
      @schools[5][:niveles].should eq([:especial,:guarderia,:infantil,:primaria,:eso])
    end

    it "should return schools with the correct levels (2)" do
      @schools[34][:niveles].should eq([:fp, :guarderia, :infantil, :primaria, :eso])
    end

		it "should return gps coordinates" do
			@schools[0][:latitud].should eq("40.409346")
			@schools[0][:longitud].should eq("0.42233")
		end

    it "should create a file named guarderia_castellon_privado.yml" do
			File.exists?("#{Scrapper::SAVED_FILES}/castellonguarderiaprivado.yml").should eq(true)
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
end
