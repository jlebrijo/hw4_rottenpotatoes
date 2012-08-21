require 'spec_helper'

describe MoviesController do
  describe 'search for movies by director' do
    before :each do
      @fake_results = [mock('movie1'),mock('movie2')]
      
    end
    it 'should select the search with the same director' do
      Movie.stub(:find).and_return(Movie.new(:director => "Ridley Scott"))
      Movie.stub(:find_all_by_director).and_return(@fake_results)
      post :find_by_director, {:movie_id => 1}
      response.should render_template('find_by_director')
    end
    it 'should show an alert if the movie have no director' do
      Movie.stub(:find).and_return(Movie.new(:title => "Alien"))
      Movie.stub(:find_all_by_director).and_return(nil)
      post :find_by_director, {:movie_id => 1}
      flash[:notice].should == "'Alien' has no director info"
      response.should redirect_to(movies_path)
    end
  end
end
