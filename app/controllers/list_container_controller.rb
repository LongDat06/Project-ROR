class ListContainerController < ApplicationController
  def index

    @list_container = Container.all
    
  end

  def create
    if session['container'] != nil && session[:item] != nil
      @container = Container.new(container_type: session['container'])
      @container.save
      @items = session[:item]
      @items.each do |item|
        @packing_style = item['packing_style'] 
        @length =  item['length'].to_i
        @heigth =  item['heigth'].to_i
        @width =  item['width'].to_i
        @weigth =   item['weigth'].to_i
        @cog_heigth_type =  item['cog_heigth_type']
        @cog_heigth =  item['cog_heigth'].to_i
        
        @item_into_container = @container.item.new(
                container_id: @container.id,
                packing_style: @packing_style ,
                length:  @length,
                heigth:  @heigth,
                width:   @width,
                weigth:  @weigth,
                cog_heigth_type:  @cog_heigth_type,
                cog_heigth:  @cog_heigth
              )
        @item_into_container.save
      end
      session.delete(:item)
      session.delete('container')
    end
    redirect_to list_container_index_path

  end

  def show
    @item = Item.where(container_id:  params[:id])
  end

  def destroy
    @item = Item.where(container_id:  params[:id])
    @container = Container.find(params[:id])

    @item.each do |item|
      item.destroy
    end
    @container.destroy
    redirect_to list_container_index_path

  end
end
