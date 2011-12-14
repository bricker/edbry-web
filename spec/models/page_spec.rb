require "spec_helper"

describe Page do
  describe "creation" do    
    #it "parameterizes the text_id" do
    #  page = Factory(:page)
    #  page.text_id = "Mission-Impossible"
    #  page.save
    #  page.text_id.should eq("mission-impossible")
    #end
    
    it "occurs when proper attributes are entered" do
      page = Factory(:page)
      Page.all.count.should eq(1)
    end
  end # Page creation
end