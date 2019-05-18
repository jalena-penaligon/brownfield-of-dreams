# frozen_string_literal: true

class VideoSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :position
end
