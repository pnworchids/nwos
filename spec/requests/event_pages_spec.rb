require 'spec_helper'

describe "Event pages" do

  subject { page }

  shared_examples_for "all event pages" do
    it { should have_title(full_title(page_title)) }
  end

  describe "Event page" do
    before { visit events_path }
    let (:page_title) {'Events'}
    
    it_should_behave_like "all event pages"

    # it "works!" do
    #   get events_path
    #   expect(response.status).to eq(200)
    # end
  end
end
