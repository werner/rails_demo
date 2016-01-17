# Internal: Season serializer
class SeasonSerializer < ActiveModel::Serializer
  attributes :id, :title, :plot, :created_at, :episodes

  def episodes
    object.episodes.order(:number)
  end
end
