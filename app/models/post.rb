
# it is one record in the database -> active record
class Post < ApplicationRecord
    belongs_to :category
    has_many :taggings
    has_many :tags, through: :taggings
    # we can acess and query cateogry from posts now
    default_scope { order :created_at}
    # scopes are like named queries that we can fire
    #antyime using console
    scope :published, -> {where(published:true)}
    scope :unpublished, -> {where.not(published:true) }
    # OVerries default scope named order
    scope :order_by_latest, ->{ reorder(created_at: :desc)}
end
