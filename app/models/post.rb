
# it is one record in the database -> active record
class Post < ApplicationRecord
    belongs_to :category
    belongs_to :user
    has_many :taggings, dependent: :destroy
    has_many :tags, through: :taggings
    # we can acess and query cateogry from posts now
    default_scope { order :created_at}
    # scopes are like named queries that we can fire
    #antyime using console
    scope :published, -> {where(published:true)}
    scope :unpublished, -> {where.not(published:true) }
    # OVerries default scope named order
    scope :order_by_latest, ->{ reorder(created_at: :desc)}

    #getter of custom attribute, not linked to database
    def all_tags=(tag_names)
        if tag_names.blank?
            return
        end
        #tag_names => tag1,tag2,tag3
        self.tags = tag_names.split(",").map do |tag_name|
            unless tag_name.blank?
                Tag.where(name: tag_name.strip).first_or_create!
            end
        end
    end

    def all_tags
        tags.map(&:name).join(", ")
    end


end
