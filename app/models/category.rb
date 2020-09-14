class Category < ApplicationRecord
    validates :name, presence: true
    #this relationship is defined to access posts from category
    # this will help us query posts from category
    #this build inubuilt methods that can access posts
    has_many :posts, ->{ order 'created_at DESC' }, dependent: :destroy #nullify
    # not necessary if you dont want to access posts from category

    #the lambda will save the post into category in descending
    #order not display in descending roder
end
