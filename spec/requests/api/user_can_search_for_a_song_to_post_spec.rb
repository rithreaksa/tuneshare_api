RSpec.describe 'GET /api/posts', type: :request do
  describe 'successfully get a list of songs' do
    before do
      get '/api/posts',
          params: {
            query: 'All I Want for Christmas Is You'
          }
      @search_results = RSpotify::Track.search('All I Want for Christmas Is You')
      @track = @search_results[0]
    end

    it 'is expected to return 200 status' do
      expect(response).to have_http_status 200
    end

    it 'is expected to return a list of songs that contain query param' do
      expect(@search_results.count).to eq 20
    end

    it 'is expected to return a name of the song ' do
      expect(@track.name).to eq 'All I Want for Christmas Is You'
    end

    it 'is expected to return an artist name of the song ' do
      expect(@track.artists[0].name).to eq 'Mariah Carey'
    end

    it 'is expected to return an image of the song album' do
      expect(@track.album.images[0]['url']).to eq 'https://i.scdn.co/image/ab67616d0000b2734246e3158421f5abb75abc4f'
    end

    it 'is expected to return a preview url of the song' do
      expect(@track.preview_url).to eq 'https://p.scdn.co/mp3-preview/bbafd15ff484394a0ca106d5fef0a81eeea4ef5b?cid=9165f2ed52ac4632b2c23038c2fbe1d9'
    end
  end
end