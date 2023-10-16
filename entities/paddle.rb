class Paddle

    attr_accessor :x, :y, :score

    def initialize(x,y,b1,b2,w,h)
        @score = 0
        @w = w
        @h = h
        @x= x
        @y = y
        @b1 = b1
        @b2 = b2
        @image = Gosu::Image.new("./img/pong_paddle.jpg")
        #@boing = Gosu::Sample.new("./media/samples/boing.mp3")
        @incr_x = 12
    end

    def update
        if Gosu.button_down?(@b1)
            if @x > 0
                @x -= @incr_x
            end
        end
        if Gosu.button_down?(@b2)
            if @x < @w -200
                @x += @incr_x
            end
        end
    end

    def draw
        @image.draw(@x,@y)
    end
end