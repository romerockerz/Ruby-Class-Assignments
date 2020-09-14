class HomeController < ApplicationController
    def ok
    #nil 
    # try to render a view default is not there
    # so it tries to reach this below location
    # views/controllername/index.html.erb

    #but we can render simple messages
    render plain: "OK"
    end

    def index
        @categories = Category.all.includes(:posts)
        @tags = Tag.all.includes(:posts)
        @posts = Post.includes(:tags).published.order_by_latest
    end

    def tag_search
        if params.has_key? (:tag)
        result = Tag.where(name: params[:tag])    
        #@posts = Tag.find_by(name: => params[:tag]).posts
        @posts =  result.blank? ? [] : result.first.posts
        end
        render "home/index"
    end    

    def read
        @post = Post.find(params[:id])
    end
    def category_search
        @category = Category.find(params[:id])
    end

    def about 
    end

    def contact
    end



end
