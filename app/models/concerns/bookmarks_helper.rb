# frozen_string_literal: true

module BookmarksHelper
  def display_bookmarks
    display_hash = Hash.new { |hash, key| hash[key] = [] }
    retrieve_bookmarks.each do |bookmark|
      key = { bookmark.tutorial_id => bookmark.tutorial_title }
      value = { bookmark.id => bookmark.title }
      display_hash[key] << value
    end
    display_hash
  end
end
