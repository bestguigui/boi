require 'gosu'

class Character
  def initialize(x = 0, y = 0)
    @x, @y = x, y
  end

  def update
  	velocity = 2
  	# horizontal movement
    if Gosu::button_down?(Gosu::KB_RIGHT)
      @x += velocity
    elsif Gosu::button_down?(Gosu::KB_LEFT)
      @x -= velocity
    end
    # vertical movement
    if Gosu::button_down?(Gosu::KB_DOWN)
      @y += velocity
    elsif Gosu::button_down?(Gosu::KB_UP)
      @y -= velocity
    end
  end

  def draw
    size = 32
    color = Gosu::Color::GREEN
    Gosu::draw_rect(@x - size/2, @y - size/2, size, size, color)  
  end
end

class Window < Gosu::Window
  def initialize
    super(640, 480, false)
    self.caption = 'BoI clone'

    @character = Character.new(self.width/2, self.height/2)
  end

  def needs_cursor?; true; end

  def button_down(id)
    super
    close! if id == Gosu::KB_ESCAPE
  end

  def update
    @character.update
  end

  def draw
    @character.draw
  end
end

Window.new.show