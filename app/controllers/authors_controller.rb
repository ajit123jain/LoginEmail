class AuthorsController < ApplicationController
  before_action :set_author, only: [:show, :edit, :update, :destroy]
  before_action :all_authors, only: [:update, :create]
  # GET /authors
  # GET /authors.json
  def index
    @authors = Author.all
  end

  # GET /authors/new
  def new
    @author = Author.new
  end

  # POST /authors
  # POST /authors.json
  def create
    @authors = Author.all
    @author = Author.new(author_params)
    # respond_to do |format|
      if @author.save!
        UserNotifier.author_creation_email(@author).deliver  
        # format.js { }
       # format.html { redirect_to @author, notice: 'Author was successfully created.' }
       # format.json { render :show, status: :created, location: @author }
       # Deliver the signup email
       
       
    #   else
    #     format.js { render :new }
    #     format.json { render json: @author.errors, status: :unprocessable_entity }
    #   end
    end
  end

  # GET /authors/1/edit
  def edit
  end

  # PATCH/PUT /authors/1
  # PATCH/PUT /authors/1.json
  def update
    respond_to do |format|
      if @author.update(author_params)
       format.js { } 
       UserNotifier.author_creation_email(@author)
       # format.html { redirect_to @author, notice: 'Author was successfully updated.' }
       # format.json { render :show, status: :ok, location: @author }
      else
        format.js { render :edit }
        # format.json { render json: @author.errors, status: :unprocessable_entity }
      end
    end
  end


  # GET /authors/1
  # GET /authors/1.json
  def show
  end

  def delete
  @author = Author.find(params[:author_id])
  end

  # DELETE /authors/1
  # DELETE /authors/1.json
  def destroy
    @posts = Post.where(author_id: @author.id).destroy_all
    @author.destroy

    respond_to do |format|
      format.html { redirect_to authors_url, notice: 'Author was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_author
      @author = Author.find(params[:id])
    end

    def all_authors
      @authors = Author.all
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def author_params
      params.require(:author).permit(:name,:email)
    end
end
