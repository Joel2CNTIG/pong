class Score 

    def initialize(x, y, window)
        @window = window
        @x = x
        @y = y
        @font = Gosu::Font.new(window, Gosu::default_font_name, 20)
    end

    def draw
        @font.draw("#{@window.paddle1.score} | #{@window.paddle2.score}", @x, @y, 1, 1.0, 1.0)
    end

end
