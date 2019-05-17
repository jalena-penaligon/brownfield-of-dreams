require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it {should validate_presence_of(:email)}
    it {should validate_presence_of(:first_name)}
    it {should validate_presence_of(:password)}
  end

  describe 'roles' do
    it 'can be created as default user' do
      user = User.create(email: 'user@email.com', password: 'password', first_name:'Jim', role: 0)

      expect(user.role).to eq('default')
      expect(user.default?).to be_truthy
    end

    it 'can be created as an Admin user' do
      admin = User.create(email: 'admin@email.com', password: 'admin', first_name:'Bob', role: 1)

      expect(admin.role).to eq('admin')
      expect(admin.admin?).to be_truthy
    end
  end

  describe 'instance methods' do
    describe "friendships?" do
      it "determines whether or not user has friendships" do
        user = User.create(email: 'user@email.com', password: 'password', first_name:'Jim', role: 0)
        expect(user.friendships?).to be false
        Friendship.create(user_id: user.id, friend_id: 2, friend_login: "Friend")
        expect(user.friendships?).to be true
      end
    end

    describe "friend?" do

    end

    describe 'confirmation_token' do
      it 'updates a users confirm_token' do
        user = User.create(email: 'user@email.com', password: 'password', first_name:'Jim', role: 0)
        expect(user.confirm_token).to eq(nil)

        user.confirmation_token
        expect(user.confirm_token).to_not eq(nil)
        expect(user.confirm_token).to be_a(String)
      end
    end

    it 'returns tutorials with bookmarked videos' do
      user = create(:user)
      tutorial= create(:tutorial, title: "I Love Pineapple Pizza")
      video = create(:video, title: "The Best Video", tutorial_id: tutorial.id, position: 3)
      video_2 = create(:video, title: "The Best Video V2", tutorial_id: tutorial.id, position: 2)
      video_3 = create(:video, title: "The Best Video V3", tutorial_id: tutorial.id, position: 1)

      user.user_videos.create(video_id: video.id)
      user.user_videos.create(video_id: video_3.id)

      expect(user.get_bookmarks.first.tutorial_title).to eq(tutorial.title)
      expect(user.get_bookmarks.first.tutorial_id).to eq(tutorial.id)
      expect(user.get_bookmarks.first.id).to eq(video_3.id)
      expect(user.get_bookmarks.last.id).to eq(video.id)
      expect(user.get_bookmarks.last.title).to eq(video.title)
    end

    it 'formats users bookmarks to a hash' do
      user = create(:user)
      tutorial= create(:tutorial, title: "I Love Pineapple Pizza")
      video = create(:video, title: "The Best Video", tutorial_id: tutorial.id, position: 3)
      video_2 = create(:video, title: "The Best Video V2", tutorial_id: tutorial.id, position: 2)
      video_3 = create(:video, title: "The Best Video V3", tutorial_id: tutorial.id, position: 1)

      user.user_videos.create(video_id: video.id)
      user.user_videos.create(video_id: video_3.id)

      result = {
        {
          tutorial.id => tutorial.title
        } => [
          {
            video_3.id => video_3.title
          },
          {
            video.id => video.title
          }
        ]
      }

      expect(user.display_bookmarks).to eq(result)
    end
  end
end
