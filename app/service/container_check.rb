class ContainerCheck < ApplicationService
    def initialize(params1,params2)
        @container_type = params1
        @items = params2
    end 

    def call
        @Totol_error = containercheck()
        return @Totol_error
    end

    def containercheck
            if @container_type == "FR20" || @container_type == "FR40"
                @Totol_error = FlattrackContainer.call(@container_type,@items)

            elsif @container_type == "OT20" || @container_type == "OT40"
                @Totol_error = OpentopContainer.call(@container_type,@items)
            end

        return @Totol_error
    end

    

end