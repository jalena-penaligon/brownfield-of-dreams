namespace :run do
  desc "TODO"
  task video_reset: :environment do
    videos = Video.where(position: nil)
    videos.each do |video|
      video.update_column(:position, 0)
    end
  end
end
