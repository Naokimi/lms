class Api::V1::LearningPlaylistsController < Api::V1::SecureController
  def index
    playlists = LearningPlaylist.all
    render json: playlists
  end
end
