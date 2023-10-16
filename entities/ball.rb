class Ball


    def initialize(x , y, p1, p2, w, h)
        @w = w
        @h = h
        @x = x
        @y = y
        @p1 = p1
        @p2 = p2
        @image = Gosu::Image.new("./img/ball.jpg")
        @ball_incr_x = 0
        if rand(0..1) == 0
            @ball_incr_y = 8
        else
            @ball_incr_y = -8
        end
    end

    def update
        if ((@x-20)..(@x+20)).first <= ((@p1.x-20)..(@p1.x+180)).last && ((@x-20)..(@x+20)).last >= ((@p1.x-20)..(@p1.x+180)).first && ((@y-20)..(@y+20)).first <= ((@p1.y-20)..(@p1.y+20)).last && ((@y-20)..(@y+20)).last >= ((@p1.y-20)..(@p1.y+20)).first
            @ball_incr_y *= -1 
            incr = (@x - (@p1.x + 80))/10
            @ball_incr_x = @ball_incr_x + incr
        end
        if ((@x-20)..(@x+20)).first <= ((@p2.x-20)..(@p2.x+180)).last && ((@x-20)..(@x+20)).last >= ((@p2.x-20)..(@p2.x+180)).first && ((@y-20)..(@y+20)).first <= ((@p2.y-20)..(@p2.y+20)).last && ((@y-20)..(@y+20)).last >= ((@p2.y-20)..(@p2.y+20)).first
            @ball_incr_y *= -1 
            incr = (@x - (@p2.x + 80))/10
            @ball_incr_x = @ball_incr_x + incr
        end
        if @x-20 <= 0 || @x+20 >= @w
            @ball_incr_x *= -1
        end
        if @y+20 <= 0 || @y+20 >= @h
            if @y+20 <= 0
                @p2.score += 1
            else
                @p1.score += 1
            end
            @x = @w/2 - 20
            @y = @h/2 - 20
            @p1.x = @w/2 - 100
            @p1.y = 0.95*@h - 20
            @p2.x = @w/2 - 100
            @p2.y = 0.05*@h - 20
            @ball_incr_x = 0
            if rand(0..1) == 0
                @ball_incr_y = 8
            else
                @ball_incr_y = -8
            end
            sleep(3)
        end
        if @ball_incr_x > 16
            @ball_incr_x = 16
        end
        if @ball_incr_x < -16
            @ball_incr_x = -16
        end
        @x += @ball_incr_x
        @y += @ball_incr_y
    end

    def draw
        @image.draw(@x,@y)
    end
end



