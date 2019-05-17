namespace :import do
  desc "TODO"
  task turing_tutorials: :environment do
    Rake::Task["db:drop"].execute
    Rake::Task["db:create"].execute
    Rake::Task["db:migrate"].execute
    Rake::Task["db:seed"].execute

    videos = Video.where(position: nil)
    videos.each do |video|
      video.update_column(:position, 0)
    end
  end

end
