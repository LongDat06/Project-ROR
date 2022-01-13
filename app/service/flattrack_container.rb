class FlattrackContainer < ApplicationService
    def initialize(params1,params2)
        @container_type = params1
        @items = params2
    end 

    def call
        @Totol_error = flatrack()
        return @Totol_error
    end

    def heigth_max
        @heigth_max = 0
        @items.each do |item|
            if item['heigth'].to_i > @heigth_max
                @heigth_max = item['heigth'].to_i
            end
        end
        return @heigth_max
    end

    def flatrack()
        @Totol_error = []
        @items.each do |item|
            @error = []
            if item['packing_style'] == "BARE" || item['packing_style'] == "SKID"
                @error.push('Further evaluation is required. Reason : Packing style')
                # puts " #{@error}"
                zone_A(item,@error)
            else item['packing_style'] == "CASE" || item['packing_style'] == "CRATE"
                # puts " #{item}"
                zone_A(item,@error)
            end
            @Totol_error.push(@error)
        end
        puts "#{@Totol_error}"
        return @Totol_error
    end

    def zone_A(item,error)
        case @container_type
        when "FR20"
            if item['width'].to_i > 380 
                @error.push('Width exceeds criteria')
                # puts " #{@error}"
                zone_B(item,@error)
            else 
                zone_B(item,@error)
            end
        when "FR40"
            if item['width'].to_i > 470
                @error.push('Width exceeds criteria')
                zone_B(item,@error)
            else
                zone_B(item,@error)
            end
        end
    end

    def zone_B(item,error)
        case @container_type
        when "FR20"
            if item['length'].to_i > 529
                error.push('Length exceeds criteria. Further evaluation by SCM is required.')
                weight_distribution(item,@error)

            else 
                weight_distribution(item,@error)
            end
        when "FR40"
            if item['length'].to_i > 1150
                @error.push('Length exceeds criteria. Further evaluation by SCM is required.')
                weight_distribution(item,@error)
  
            else
                weight_distribution(item,@error)
            end
        end
    end

    def weight_distribution (item,error)
        @weigth_max
        @length = item['length'].to_i
        case @container_type
        when "FR40"
            case @length
            when 0..99
                @weigth_max = 19350
                if item['weigth'].to_i < @weigth_max
                    @error.push('Weigth Distribution exceeds criteria. Further evaluation by SCM is required.')
                    zone_C(item,@error)
  
                else 
                    zone_C(item,@error)
                end
  
            when 100..199
                @weigth_max = 20191
                if item['weigth'].to_i > @weigth_max
                    @error.push('Weigth Distribution exceeds criteria. Further evaluation by SCM is required.')
                    zone_C(item,@error)
  
                else 
                    zone_C(item,@error)
                end
  
            when 200..299
                @weigth_max = 21109
                if item['weigth'].to_i > @weigth_max
                    @error.push('Weigth Distribution exceeds criteria. Further evaluation by SCM is required.')
                    zone_C(item,@error)
  
                else 
                    zone_C(item,@error)
                end
  
            when 300.399
                @weigth_max = 22114
                if item['weigth'].to_i > @weigth_max
                    @error.push('Weigth Distribution exceeds criteria. Further evaluation by SCM is required.')
                    zone_C(item,@error)
  
                else 
                    zone_C(item,@error)
                end
  
            when 400.499
                @weigth_max = 23220
                if item['weigth'].to_i > @weigth_max
                    @error.push('Weigth Distribution exceeds criteria. Further evaluation by SCM is required.')
                    zone_C(item,@error)
  
                else 
                    zone_C(item,@error)
                end
  
            when 500..599
                @weigth_max = 24442
                if item['weigth'].to_i > @weigth_max
                    @error.push('Weigth Distribution exceeds criteria. Further evaluation by SCM is required.')
                    zone_C(item,@error)
  
                else 
                    zone_C(item,@error)
                end
  
            when 600..699
                @weigth_max = 25800
                if item['weigth'].to_i > @weigth_max
                    @error.push('Weigth Distribution exceeds criteria. Further evaluation by SCM is required.')
                    zone_C(item,@error)
  
                else 
                    zone_C(item,@error)
                end
  
            when 700..799
                @weigth_max = 27318
                if item['weigth'].to_i > @weigth_max
                    @error.push('Weigth Distribution exceeds criteria. Further evaluation by SCM is required.')
                    zone_C(item,@error)
  
                else 
                    zone_C(item,@error)
                end
  
            when 800..899
                @weigth_max = 29025
                if item['weigth'].to_i > @weigth_max
                    @error.push('Weigth Distribution exceeds criteria. Further evaluation by SCM is required.')
                    zone_C(item,@error)
  
                else 
                    zone_C(item,@error)
                end
  
            when 900..999
                @weigth_max = 30960
                if item['weigth'].to_i > @weigth_max
                    @error.push('Weigth Distribution exceeds criteria. Further evaluation by SCM is required.')
                    zone_C(item,@error)
  
                else 
                    zone_C(item,@error)
                end
  
            when 1000..1099
                @weigth_max = 33171
                if item['weigth'].to_i > @weigth_max
                    @error.push('Weigth Distribution exceeds criteria. Further evaluation by SCM is required.')
                    zone_C(item,@error)
  
                else 
                    zone_C(item,@error)
                end
  
            when 1100..1199
                @weigth_max = 35723
                if item['weigth'].to_i > @weigth_max
                    @error.push('Weigth Distribution exceeds criteria. Further evaluation by SCM is required.')
                    zone_C(item,@error)
  
                else 
                    zone_C(item,@error)
                end
  
            when 1200..
                @weigth_max = 38700
                if item['weigth'].to_i > @weigth_max
                    @error.push('Weigth Distribution exceeds criteria. Further evaluation by SCM is required.')
                    zone_C(item,@error)
  
                else 
                    zone_C(item,@error)
                end
            end
  
        when "FR20"
            case @length
            when 0
                @weigth_max = 15350
                if item['weigth'].to_i > @weigth_max
                    @error.push('Weigth Distribution exceeds criteria. Further evaluation by SCM is required.')
                    # puts " #{@error}"
                    zone_C(item,@error)
  
                else 
                    zone_C(item,@error)
                end
  
            when 50
                @weigth_max = 16017
                if item['weigth'].to_i > @weigth_max
                    @error.push('Weigth Distribution exceeds criteria. Further evaluation by SCM is required.')
                    zone_C(item,@error)
  
                else 
                    zone_C(item,@error)
                end
  
            when 100
                @weigth_max = 16745
                if item['weigth'].to_i > @weigth_max
                    @error.push('Weigth Distribution exceeds criteria. Further evaluation by SCM is required.')
                    zone_C(item,@error)
  
                else 
                    zone_C(item,@error)
                end
  
            when 150
                @weigth_max = 17543
                if item['weigth'].to_i > @weigth_max
                    @error.push('Weigth Distribution exceeds criteria. Further evaluation by SCM is required.')
                    zone_C(item,@error)
  
                else 
                    zone_C(item,@error)
                end
  
            when 200
                @weigth_max = 18420
                if item['weigth'].to_i > @weigth_max
                    @error.push('Weigth Distribution exceeds criteria. Further evaluation by SCM is required.')
                    zone_C(item,@error)
  
                else 
                    zone_C(item,@error)
                end
  
            when 250
                @weigth_max = 19389
                if item['weigth'].to_i > @weigth_max
                    @error.push('Weigth Distribution exceeds criteria. Further evaluation by SCM is required.')
                    zone_C(item,@error)
  
                else 
                    zone_C(item,@error)
                end
  
            when 300
                @weigth_max = 20467
                if item['weigth'].to_i > @weigth_max
                    @error.push('Weigth Distribution exceeds criteria. Further evaluation by SCM is required.')
                    zone_C(item,@error)
  
                else 
                    zone_C(item,@error)
                end
  
            when 350
                @weigth_max = 21671
                if item['weigth'].to_i > @weigth_max
                    @error.push('Weigth Distribution exceeds criteria. Further evaluation by SCM is required.')
                    zone_C(item,@error)
  
                else 
                    zone_C(item,@error)
                end
  
            when 400
                @weigth_max = 23025
                if item['weigth'].to_i > @weigth_max
                    @error.push('Weigth Distribution exceeds criteria. Further evaluation by SCM is required.')
                    zone_C(item,@error)
  
                else 
                    zone_C(item,@error)
                end
  
            when 450
                @weigth_max = 24560
                if item['weigth'].to_i > @weigth_max
                    @error.push('Weigth Distribution exceeds criteria. Further evaluation by SCM is required.')
                    zone_C(item,@error)
  
                else 
                    zone_C(item,@error)
                end
  
            when 500
                @weigth_max = 26314
                if item['weigth'].to_i > @weigth_max
                    @error.push('Weigth Distribution exceeds criteria. Further evaluation by SCM is required.')
                    zone_C(item,@error)
  
                else 
                    zone_C(item,@error)
                end
  
            when 550
                @weigth_max = 28338
                if item['weigth'].to_i > @weigth_max
                    @error.push('Weigth Distribution exceeds criteria. Further evaluation by SCM is required.')
                    zone_C(item,@error)
  
                else 
                    zone_C(item,@error)
                end
  
            when 600
                @weigth_max = 30700
                if item['weigth'].to_i > @weigth_max
                    @error.push('Weigth Distribution exceeds criteria. Further evaluation by SCM is required.')
                    zone_C(item,@error)
  
                else 
                    zone_C(item,@error)
                end
            end
        end
    end

    def zone_C(item,error)
        if item['heigth'].to_i > 518
            @error.push('Heigth exceeds criteria')
            cog_calculation(item,@error)
  
        else
            cog_calculation(item,@error)
        end
    end

    def cog_calculation(item,error)
        if item['cog_heigth_type'] == "HALF HEIGHT"
            zone_D_1(item,@error)
  
        elsif item['cog_heigth_type'] == "TBA"
            @error.push('This acceptance check has to be done again after COG height is determined. This result assuming that the COG is half height of the cargo as you inputted TBA for COG.')
            zone_D_1(item,@error)
  
        elsif  item['cog_heigth_type'] == "MANUAL"
            zone_D_2(item,@error)
            
        end
    end

    def zone_D_1(item,error)
        case @container_type
        when "FR20"
            if item['width'].to_i <= 243 
                zone_E(item,@error)	
            elsif item['width'].to_i > 243 || item['width'].to_i < 380
                zone_F(item,@error)	
            end
        when "FR40"
            if item['width'].to_i <= 243 
                zone_E(item,@error)	
            elsif item['width'].to_i > 243 || item['width'].to_i < 470
                zone_F(item,@error)	
            end
        end
    end
  
    def zone_D_2(item,error)
        case @container_type
        when "FR20"
            if item['width'].to_i <= 243 
                zone_H(item,@error)	
            elsif item['width'].to_i > 243 || item['width'].to_i < 380
                zone_G(item,@error)	
            end
        when "FR40"
            if item['width'].to_i <= 243 
                zone_H(item,@error)	
            elsif item['width'].to_i > 243 || item['width'].to_i < 470
                zone_G(item,@error)	
            end
        end
    end

    def zone_E(item,error)
        @heigth_max = heigth_max()
        @Cogh_value = @heigth_max/2
        @var = item['width'].to_i * 0.865
        if @Cogh_value > @var 
            @error.push('COG Height exceeds criteria')

        elsif @Cogh_value <= @var
            puts "ok"

        end
    end

    def zone_F(item,error)
        @heigth_max = heigth_max()
        @Cogh_value = @height_max/2
        if @Cogh_value > 190 
            @error.push('COG Height exceeds criteria')
            
        elsif @Cogh_value <= 190
            puts "ok"

        end 
    end

    def zone_G(item,error)
        if item['cog_heigth'].to_i > 190 
            @error.push('COG Height exceeds criteria')
            # puts "#{@error}"
        elsif item['cog_heigth'].to_i <= 190
            puts "ok"
            # puts "#{@error}"
        end 
    end
  
    def zone_H(item,error)
        @var = item['width'].to_i * 0.865
        if item['cog_heigth'].to_i > @var 
            @error.push('COG Height exceeds criteria')
            # puts "#{@error}"
        elsif item['cog_heigth'].to_i <= @var
            puts "ok"
            # puts "#{@error}"
        end 
    end
end