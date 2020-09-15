class TagsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_tag, only: [:show, :destroy, :edit, :update]
  def index
    @tags = Tag.all
    if params[:format] == "html" 
      p params[:format]
    elsif params[:format] == "json"
      # using default json renderer
      #not using json builder
      render json: @tags  
    end  
  end

  def show
    #@tag = Tag.find(params[:id])
    if params[:format] == "html"
    elsif params[:format] == "json"
      p @tag.to_json
      # these are same, browser call to_json internally
      render json: @tag  
    end  
  end

  def destroy
    #@tag = Tag.find(params[:id])
    @tag.destroy
    redirect_to tags_path, notice: "Tag was successfully deleted"
  end
  def new
    @tag =  Tag.new
  end
  def edit 
  end

  # this method runs when we get a POST request to tags
  def create 
    p params
    #@tag = Tag.new(params)
    #grabbing params
    @tag = Tag.new(tag_params)
    #saving params to db
    if @tag.save
    #PRG :- whenever you do a post redirect to do a GEt request
    #if you refresh the browser it could do post request again
    #duplicating the post request. 

      redirect_to tags_path, notice: "Tag was successfully created"
    else 
      p @tag.errors.full_messages
      render :new
    end  
  end
  
  #PATH/PUT /Tags/[:id]
  def update
    #update tags set name = "name" where id = :id
    if @tag.update(tag_params)
      redirect_to tags_path, notice: "Tag was successfully updated"
    else
      render :edit
    end
  end
  private 
  def set_tag
    #byebug
    #avoiding duplications in methods
    #before action it will already be stored in 
    #instance variable
    @tag = Tag.find(params[:id])
  end
  def tag_params
    params.require(:tag).permit(:name)
  end

end
