require 'spec_helper'

describe Scrapper do
  context "given a query to guarderia level" do 
    before(:all) do
      VCR.use_cassette "guarderia" do
        @schools = Scrapper::scrap(:nivel => :guarderia, :provincia => :castellon, :regimen => :privado)
      end
    end 

		after(:all) do
		  # TODO: delete export directory and all files inside	
		end

    it "should return all schools from that level" do
      @schools.size.should eq(36)
    end

		it "should return correct name school" do
      pending
		end

		it "should return correct web page school" do
      pending
	  end

		it "should return correct address school" do
			pending
		end

		it "should return correct phone school" do
			pending
		end

		it "should return correct city school" do
		  pending
		end

		it "should return correct postal code school" do
			pending
		end

		it "should return correct code school" do
			pending
		end

    it "should return schools with the correct levels (1)" do
      @schools[5][:niveles].should eq([:especial,:guarderia,:infantil,:primaria,:eso])
    end

    it "should return schools with the correct levels (2)" do
      @schools[34][:niveles].should eq([:fp, :guarderia, :infantil, :primaria, :eso])
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
      pending
    end
  end
end
