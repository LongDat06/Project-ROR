class OpentopContainer < ApplicationService
    def initialize(params1,params2)
        @container_type = params1
        @items = params2
    end 

    def call
        @Totol_error = open_top()
        return @Totol_error
    end

    def open_top()
        @Totol_error = []
        @items.each do |item|
            @error = []
            if item['packing_style'] == "BARE" 
                @error.push('Further evaluation is required. Reason : Packing style')
                cog_height_calculation(item,@error)

            elsif item['packing_style'] == "CASE"
                cog_height_calculation(item,@error)
            end
            @Totol_error.push(@error)
        end
        return @Totol_error
    end
  

    def cog_height_calculation(item,error)
        if item['cog_heigth_type'] == "MANUAL" || item['cog_heigth_type'] == "HALF HEIGHT"
            zone_I(item,@error)
        
        elsif item['cog_heigth_type'] == "TBA"
            @error.push('This acceptance check has to be done again after COG height is determined. This result assuming that the COG is half height of the cargo as you inputted TBA for COG.')
            zone_I(item,@error)

        end
        
    end
  
    def zone_I(item,error)
        if item['cog_heigth_type'] == "MANUAL"
            if item['cog_heigth'].to_i  > 211
                @error.push('COG Height exceeds criteria')
                zone_J(item,@error)
  
            else
                zone_J(item,@error)
            end
        
        elsif item['cog_heigth_type'] == "HALF HEIGHT" || item['cog_heigth_type'] == "TBA"
            @heigth = item['cog_heigth'].to_i
            @var = @heigth  /2
            if @var > 211
                @error.push('COG Height exceeds criteria')
                zone_J(item,@error)
  
            else
                zone_J(item,@error)
            end
       
        end
    end
  
    def zone_J(item,error)
        @weigth = item['weigth'].to_i
        @length = item['length'].to_i
        if @length != 0
            @var = @weigth/@length
        else
            @var = 0
            @error.push('Weigth Distribution exceeds criteria. Further evaluation by SCM is required.')
        end
        case @container_type
        when "OT20"
            if @var > 3
                @error.push('Weigth Distribution exceeds criteria. Further evaluation by SCM is required.')
            else
                puts "ok"
            end
        when "OT40"
            if @var > 4.5
                @error.push('Weigth Distribution exceeds criteria. Further evaluation by SCM is required.')
            else
                puts "ok"
            end
        end
    end
end
