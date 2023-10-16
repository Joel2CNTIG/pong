require 'gosu'
require_relative './entities/paddle'
require_relative './entities/ball'
require_relative './entities/score'

class Game < Gosu::Window

    attr_reader :paddle1, :paddle2

    def initialize 
        @w = 800
        @h = 600
        super(@w,@h)
        self.caption = "pong"
        @paddle1 = Paddle.new(@w/2 - 100, 0.95*@h - 20, Gosu::KbA, Gosu::KbD, @w, @h)
        @paddle2 = Paddle.new(@w/2 - 100, 0.05*@h - 20, Gosu::KbLeft, Gosu::KbRight, @w, @h)
        @ball = Ball.new(@w/2 - 20, @h/2 - 20, @paddle1, @paddle2, @w, @h)
        @score = Score.new(@w - 80, @h - 80, self)
    end

    def update
        @paddle1.update
        @paddle2.update
        @ball.update
    end

    def draw
        @paddle1.draw
        @paddle2.draw
        @ball.draw
        @score.draw
    end


end

game = Game.new
game.show
        
