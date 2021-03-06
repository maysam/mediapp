class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy, :publish, :hide]

  # GET /items
  # GET /items.json
  def index
    @items = current_user.items
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(item_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to items_url, notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to items_url, notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  def publish
    @item.publish
    redirect_to items_url, notice: 'Item was successfully published.'
  end

  def hide
    @item.hide
    redirect_to items_url, notice: 'Item was successfully privatized.'
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = current_user.items.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params[:item][:user_id] = current_user.id
      params.require(:item).permit(:title, :link, :user_id, :image)
      # params.require(:item).permit(:title, :link, :user_id, image: [:tempfile, :original_filename, :content_type, :headers])
    end
end
