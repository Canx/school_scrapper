require 'spec_helper'

describe Scrapper do
  context "given a query to guarderia level" do 

    before(:all) do
      VCR.use_cassette "guarderia" do
        @schools = Scrapper::scrap(:nivel => :guarderia, :provincia => :castellon, :regimen => :privado)
      end
    end 

    it "should return all schools from that level" do
      @schools.size.should eq(36)
    end

    it "should return schools with the correct levels (1)" do
      @schools[5][:niveles].should eq([:especial,:guarderia,:infantil,:primaria,:eso])
    end

    it "should return schools with the correct levels (2)" do
      @schools[34][:niveles].should eq([:fp, :guarderia, :infantil, :primaria, :eso])
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
